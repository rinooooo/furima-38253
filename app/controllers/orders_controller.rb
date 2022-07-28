class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:index, :create]

  def index
    if current_user.id == @item.user.id || @item.order.present?
      redirect_to root_path
    end
    @delivery_card = DeliveryCard.new
  end

  def create
    @delivery_card = DeliveryCard.new(order_params)
    if @delivery_card.valid?
      @delivery_card.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_params
    params.require(:delivery_card).permit(:post_code, :delivery_area_id, :town, :address, :house_name, :phone_number, :card_number, :card_date_month, :card_date_year, :card_security).merge(user_id: current_user.id, item_id: @item.id)
  end

  def find_params
    @item = Item.find(params[:item_id])
  end



end
