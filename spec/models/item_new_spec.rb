require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item.name = 'aaa'
      @item.detail = 'aaa'
      @item.category_id = 1
      @item.status_id = 1
      @item.delivery_fee_id = 1
      @item.place_from_id = 1
      @item.date_shipment_id = 1
      @item.price = 1000
    end

    it '全てで保存可能' do
      expect(@item).to be_valid
    end

    it '画像なしは出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名なしは出品できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明必須' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'カテゴリー必須' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '状態必須' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery fee must be other than 0')
    end

    it '発送元' do
      @item.place_from_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Place from must be other than 0')
    end

    it '発送までの日数' do
      @item.date_shipment_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Date shipment must be other than 0')
    end

    it '販売価格空白' do
      @item.price = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '販売価格が数値じゃない' do
      @item.price = 'aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it '販売価格300未満' do
      @item.price = 5
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '販売価格10,000,000以上' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end
  end
end
