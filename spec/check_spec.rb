require 'pry'
require 'json'

describe "Men's points" do
  it "passing" do
    File::open("spec/passing/test.json") do |io|
      data = JSON.load(io)
      data["name"].should eq "reikubonaga"
      data["answers"].should eq ["3", "2", "1", "3"]
    end
  end
end
