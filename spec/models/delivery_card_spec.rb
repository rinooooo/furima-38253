require 'rails_helper'

RSpec.describe DeliveryCard, type: :model do
  before do
    @delivery_card = FactoryBot.build(:delivery_card)
  end

  describe '商品購入' do
    context '商品購入できるとき' do
      it '必要な情報があれば購入できる' do
        expect(@delivery_card).to be_valid
      end

      it '建物名がなくても購入できる' do
        @delivery_card.house_name = ''
        expect(@delivery_card).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号がないと購入できない' do
        @delivery_card.post_code = ''
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が「3桁ハイフン4桁」の半角文字列でないと購入できない' do
        @delivery_card.post_code = '1111111'
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県がないと購入できない' do
        @delivery_card.delivery_area_id = ''
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '都道府県でーーーーが選択されている時は購入できない' do
        @delivery_card.delivery_area_id = '0'
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Delivery area can't be blank")
      end

      it '市区町村がないと購入できない' do
        @delivery_card.town = ''
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Town can't be blank")
      end

      it '番地がないと購入できない' do
        @delivery_card.address = ''
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号がないと購入できない' do
        @delivery_card.phone_number = ''
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が9桁以下だと購入できない' do
        @delivery_card.phone_number = '111111111'
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include('Phone number is invalid.')
      end
      it '電話番号が12桁以上だと購入できない' do
        @delivery_card.phone_number = '111111111111'
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include('Phone number is invalid.')
      end
      it '電話番号に半角数字以外が含まれている場合購入できない' do
        @delivery_card.phone_number = '11111aaaaa'
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include('Phone number is invalid.')
      end

      it 'トークンがないと購入できない' do
        @delivery_card.token = ''
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では購入できない' do
        @delivery_card.user_id = nil
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @delivery_card.item_id = nil
        @delivery_card.valid?
        expect(@delivery_card.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
