require 'pry'
require 'json'

describe "Men's points" do
  it "passing" do
    File::open("spec/passing/test.json") do |io|
      data = JSON.load(io)
      p data
    end
  end
end
