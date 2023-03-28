require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@purchase_shipping_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @purchase_shipping_address.building_name = ''
        expect(@purchase_shipping_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと保存できないこと' do
        @purchase_shipping_address.postal_code = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列でないと保存できないこと' do
        @purchase_shipping_address.postal_code = '123−4567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it '都道府県は「---」が選択されている場合は保存できないこと' do
        @purchase_shipping_address.origin_to_prefecture_id = '1'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Origin to prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @purchase_shipping_address.city = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @purchase_shipping_address.address_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Address number can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @purchase_shipping_address.phone_number = ''
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は9桁以下だと保存できないこと' do
        @purchase_shipping_address.phone_number = '090123456'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号は12桁以上だと保存できないこと' do
        @purchase_shipping_address.phone_number = '090123456789'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it '電話番号は半角数値でないと保存できないこと' do
        @purchase_shipping_address.phone_number = '０９０１２３４５６７８'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていないと購入できないこと' do
        @purchase_shipping_address.user_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できないこと' do
        @purchase_shipping_address.item_id = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
