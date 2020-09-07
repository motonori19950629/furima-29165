class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image
  belongs_to_active_hash :prefecture
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :detail
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :place_from_id
    validates :date_shipment_id
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :place_from_id
    validates :date_shipment_id
  end
end
