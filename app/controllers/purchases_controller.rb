class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user == @item.user || @item.purchase.present?
      redirect_to root_path
    else
      @purchase_shipping_address = PurchaseShippingAddress.new
    end
  end

  def create
    @purchase_shipping_address = PurchaseShippingAddress.new(purchase_params)
    if @purchase_shipping_address.valid?
      pay_item
      @purchase_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end
  

  private

  def purchase_params
    params.require(:purchase_shipping_address).permit(:postal_code, :origin_to_prefecture_id, :city, :address_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
