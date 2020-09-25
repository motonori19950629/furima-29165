FactoryBot.define do
  factory :purchases_address do
    token { 'token' }
    postal_code { '111-1111' }
    prefecture_id { 1 }
    city { 'ctiy' }
    street_address { 'street_address' }
    phone_number { '11111111111' }
  end
end
