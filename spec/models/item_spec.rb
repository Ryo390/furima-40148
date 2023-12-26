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
      it '商品名は40文字まで' do
        @item.item_name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item name is too long (maximum is 40 characters)'
      end
      it '商品の説明が必須であること' do
        @item.description_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description item can't be blank")
      end
      it '商品の説明は1000文字まで' do
        @item.description_item = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include 'Description item is too long (maximum is 1000 characters)'
      end
      it '商品のカテゴリーが必須であること' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が必須であること' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it '配送料の負担が必須であること' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it '発送元の地域が必須であること' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送元の地域が必須であること' do
        @item.delivery_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date can't be blank")
      end
      it '商品の価格が必須であること' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '商品の価格が全角数字では登録できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐づいていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
      it '商品の価格が300円未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '商品の価格が9_999_999円を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
