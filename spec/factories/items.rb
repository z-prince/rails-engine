FactoryBot.define do
  factory :item do
    name { Faker::Device.model_name }
    description { Faker::Marketing.buzzwords }
    unit_price { Faker::Number.number(digits: 4) }
  end
end
