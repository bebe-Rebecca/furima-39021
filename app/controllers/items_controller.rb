class ItemsController < ApplicationController
  def index
  end

  def create
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :category_id, :condition_id, :shipping_fee_burden_id, :origin_to_prefecture_id, :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end
end
