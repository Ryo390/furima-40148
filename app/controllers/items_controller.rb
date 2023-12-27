class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

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
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description_item, :category_id, :item_condition_id, :postage_id,
                                 :prefecture_id, :delivery_date_id, :price).merge(user_id: current_user.id)
  end
end
