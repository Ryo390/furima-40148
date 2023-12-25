require 'rails_helper'

RSpec.describe Item, type: :model do
  before do  
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '新規が出品できるとき' do
      it '入力必須情報が全て存在すれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it '商品画像が必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明が必須であること' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item can't be blank")
      end
      it '商品のカテゴリーが必須であること' do
        @item.category = Category.new
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が必須であること' do
        @item.item_condition = ItemCondition.new
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '商品の価格が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品の価格が全角数字では登録できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
