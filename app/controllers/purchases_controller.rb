class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index #ログインしていない人をログイン画面に遷移する


  def index
    @item = Item.find(params[:item_id])
    if @item.purchase.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:item_id])
  end

  private

  def purchase_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  # def set_purchase
  #   @item = Item.find(params[:item_id]) #indexとshow
  # end

end