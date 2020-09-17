class Address < ApplicationRecord
  belongs_to :purchase

  with_options presence: true do
    validates :prefecture_id
    validates :city
    validates :street_address
  end

end
