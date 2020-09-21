require 'rails_helper'

RSpec.describe PurchasesAddress, type: :model do
  describe '#create' do
    before do
      @purchases_address = FactoryBot.build(:purchases_address)
    end

    it '全てで保存可能' do
      expect(@purchases_address).to be_valid
    end

    it 'token無し' do
      @purchases_address.token = nil
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号無し' do
      @purchases_address.postal_code = nil
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号ハイフン無し' do
      @purchases_address.postal_code = '1111111'
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '郵便番号桁足りない' do
      @purchases_address.postal_code = '111-111'
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '郵便番号全角' do
      @purchases_address.postal_code = '１１１ー１１１１'
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include('Postal code is invalid')
    end

    it '都道府県選択しない(--)' do
      @purchases_address.prefecture_id = '0'
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include('Prefecture must be other than 0')
    end

    it '市町村無し' do
      @purchases_address.city = nil
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地無し' do
      @purchases_address.street_address = nil
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include("Street address can't be blank")
    end

    it '電話番号無し' do
      @purchases_address.phone_number = nil
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号桁足りない(９桁以下）' do
      @purchases_address.phone_number = '111111111'
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号全角' do
      @purchases_address.phone_number = '１１１１１１１１１１１'
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号ハイフンあり' do
      @purchases_address.phone_number = '111-1111-1111'
      @purchases_address.valid?
      expect(@purchases_address.errors.full_messages).to include('Phone number is invalid')
    end
  end
end
