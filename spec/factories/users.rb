FactoryBot.define do
  factory :user, aliases: [:owner] do
    name { "yusuke" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password { "hondayu3" }
  end
end
