class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item.id])
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

end
