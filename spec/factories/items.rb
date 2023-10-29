FactoryBot.define do
  factory :item do
    name {"写真集"}
    description {"世界の絶景１００選"}
    cotegory_id {2}
    condition_id {2}
    delivery_charge_id {2}
    prefecture_id {2}
    transit_day_id {2}
    price {3000}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end 
  end
end
