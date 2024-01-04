require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address)
    @purchase = FactoryBot.create(:purchase, item: @item, user: @user)
    @order_address.user_id = @user.id
    @order_address.item_id = @item.id
    @order_address.purchase_id = @purchase.id
    end

    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_address.user_id = 1
        expect(@order_address).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_address.item_id = 1
        expect(@order_address).to be_valid
      end
      it '郵便番号が「3桁+ハイフン+4桁」の組み合わせであれば保存できる' do
        @order_address.post_code = '123-4560'
        expect(@order_address).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_address.prefecture_id = 2
        expect(@order_address).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_address.municipalities = '渋谷区'
        expect(@order_address).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_address.street_address = '宇多川123'
        expect(@order_address).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
      it '電話番号が10から11番桁以内かつハイフンなしであれば保存できる' do
        @order_address.phone_number = 12_345_678_910
        expect(@order_address).to be_valid
      end

      context '配送先情報の保存ができないとき' do
        it 'user_idが空だと保存できない' do
          @order_address.user_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと保存できない' do
          @order_address.item_id = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        it '郵便番号が空だと保存できないこと' do
          @order_address.post_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code can't be blank")
        end
        it '郵便番号にハイフンがないと保存できないこと' do
          @order_address.post_code = 1234567
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
        end
        it '都道府県が「---」だと保存できないこと' do
          @order_address.prefecture_id = 1
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '都道府県が空だと保存できないこと' do
          @order_address.prefecture_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
        end
        it '市区町村が空だと保存できないこと' do
          @order_address.municipalities = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
        end
        it '番地が空だと保存できないこと' do
          @order_address.street_address = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Street address can't be blank")
        end
        it '電話番号が空だと保存できないこと' do
          @order_address.phone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号にハイフンがあると保存できないこと' do
          @order_address.phone_number = '090-1111-2222'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が12桁以上であると保存できないこと' do
          @order_address.phone_number = '090111122223333'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
        end
        it '電話番号が9桁以下であると保存できないこと' do
          @order_address.phone_number = '0901111'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
        end
        it 'トークンが空だと保存できないこと' do
          @order_address.token = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end