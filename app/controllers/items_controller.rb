class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :create]

  def index
    @items = Item.all.includes(:purchase).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save # バリデーションをクリアした時
      redirect_to root_path
    else
      render 'new'    # バリデーションに弾かれた時
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :detail,
      :category_id,
      :status_id,
      :delivery_fee_id,
      :place_from_id,
      :date_shipment_id,
      :image
    ).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
