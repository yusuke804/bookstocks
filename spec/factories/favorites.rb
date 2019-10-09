FactoryBot.define do
  factory :favorite do
    association :post
    user { post.owner }
  end
end
