class User < ApplicationRecord
  has_many :item

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :kanji_family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :kanji_first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'is invalid. Input full-width characters.' }
    validates :kana_family_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width-kana characters.' }
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, message: 'is invalid. Input full-width-kana characters.' }
    validates :birthday
  end
end
