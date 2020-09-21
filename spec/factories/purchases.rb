FactoryBot.define do
  factory :purchase do
    name { 'test' }
    detail { 'aaa' }
    category_id { 1 }
    status_id { 1 }
  end
end
