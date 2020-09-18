class PurchasesController < ApplicationController

  before_action :move_to_index
  before_action :move_to_root

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @purchase = PurchasesAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_params
    params.require(:purchase
    ).permit(:postal_code, :prefecture_id, :city, :street_address, :building, :purchase_id, :phone_number
    ).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_root
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end
