class PurchasesAddress

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :street_address, :building, :purchase_id, :phone_number

  validates :token, presence: true

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :street_address
    validates :building
    validates :phone_number, format: { with:/\A\d{10}$|^\d{11}\z/}
  end

  def save
    # ユーザーの情報を保存し、「user」という変数に入れている
    @purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building: building, purchase_id: @purchase.id, phone_number: phone_number)
  end

end