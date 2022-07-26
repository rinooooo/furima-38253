class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_area_id, :delivery_day_id, :item_price).merge(user_id: current_user.id)
  end

end
