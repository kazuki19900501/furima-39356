require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe '商品出品' do
    context '商品出品できる場合' do
      it "全ての項目が正しく入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'cotegory_idが---では出品できない' do
        @item.cotegory_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Cotegory must be other than 1"
      end
      it 'condition_idが---では出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition must be other than 1"
      end
      it 'delivery_charge_idが---では出品できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery charge must be other than 1"
      end
      it 'prefecture_idが---では出品できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture must be other than 1"
      end
      it 'transit_day_idが---では出品できない' do
        @item.transit_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Transit day must be other than 1"
      end
      it 'imageが空では保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "priceの値が300未満の場合、保存できない" do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
      end
      it "priceの値が10,000,000以上の場合、保存できない" do
        @item.price = 100000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
      end
      it "priceの値が半角数字以外だと保存できない" do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not a number"
      end
      it 'userが紐付いていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end






