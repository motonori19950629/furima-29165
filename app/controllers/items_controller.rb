class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:new, :create]

  def index
    @items = Item.all.order(created_at: :desc)
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
      render 'new' # バリデーションに弾かれた時
    end
  end

  def show
    @category = Category.data[@item.category_id][:name]
    @status = Status.data[@item.status_id][:name]
    @delivery_fee = DeliveryFee.data[@item.delivery_fee_id][:name]
    @prefecture = Prefecture.data[@item.place_from_id][:name]
    @date_shipment = DateShipment.data[@item.date_shipment_id][:name]
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      redirect_to root_path
    else
      render 'show'    # バリデーションに弾かれた時
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to root_path
    else
      render 'edit'    # バリデーションに弾かれた時
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

  def set_item
    @item = Item.find(params[:id])
  end
end
