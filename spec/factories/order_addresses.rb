FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 3 }
    city { '札幌市' }
    block { '1-1' }
    building { '札幌ビル101' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
