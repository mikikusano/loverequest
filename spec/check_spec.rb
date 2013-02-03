require 'pry'
require 'json'

describe "Men's points" do
  it "passing" do
    count = 0
    Dir.glob("spec/passing/*.json") do |file|
      io = open(file)
      data = JSON.load(io)
      if data["name"] == "reikubonaga"
        data["answers"].should eq ["3", "2", "1", "3"]
      elsif data["name"] == "awakia"
        data["answers"].should eq ["1", "0", "-1", "2"]
      else
        raise ("'#{data["name"]}' does not match known names")
      end
      count += 1
    end
    count.should eq 2
  end
end
