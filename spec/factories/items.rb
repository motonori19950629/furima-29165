FactoryBot.define do
  factory :item do
    name {"test"}
    detail {'aaa'}
    category_id {1}
    status_id  {1}
    delivery_fee_id {1}
    place_from_id {1}
    date_shipment_id {1}
    price {1000}
    association :user
  end
end

