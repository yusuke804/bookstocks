FactoryBot.define do
  factory :post do
    author_name { "test" }
    novel_title { "test" }
    introduce_content { "test" }
    tweet_content { "testtest" }
    association :owner
  end
end
