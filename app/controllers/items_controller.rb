class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:purchase]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :non_poster_to_root, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params.require(:id))
  end

  def edit
    @item = Item.find(params.require(:id))
    redirect_to root_path if user_signed_in? && current_user.id != @item.user_id && @item.purchase.present?
    return unless user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description_item, :category_id, :item_condition_id, :postage_id,
                                 :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def non_poster_to_root
    redirect_to root_path unless current_user.id == @item.user.id
  end
end
