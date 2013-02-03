# coding: utf-8

require 'pry'
require 'json'

def calc_score(answers)
  questions = {
    "デートに行きたい場所は" => {
      "映画館" => 2,
      "カラオケ" => -1,
      "遊園地" => 1,
      "家" => 0,
    },
    "好きな食べ物は何でしょう" => {
      "ケンタッキーフライドチキン" => 0,
      "いちご" => 1,
    },
    "隠し質問" => {
      "みーつけた" => 0,
    },
  }
  total = 1
  questions.keys.each do |q|
    a = answers[q]
    total += questions[q][a] || -1
  end
  total
end

describe "Men's points" do
  it "passing" do
    passing_point = 0  # FIXME
    Dir.glob("spec/passing/*") do |file|
      username = file.split('/').last
      next if username.include?(".sample")
      io = open(file)
      answers = {}
      io.each do |l|
        q, sep, a = l.strip.rpartition(': ')
        if sep.empty?
          raise "invalid format"
        end
        answers[q] = a
      end
      score = calc_score(answers)
      puts "#{username}'s score: #{score}"
      score.should >= passing_point
    end
  end
end
