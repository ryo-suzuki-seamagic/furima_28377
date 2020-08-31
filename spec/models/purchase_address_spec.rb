require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  describe '購入機能' do
    context '購入がうまくいく時' do
      it 'すべての項目がある時購入できる' do
        expect(@purchase).to be_valid
      end

      it 'building_nameが空でも登録できる' do 
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end

    context '購入がうまくいかない時' do

      it 'tokenが無いと登録できない' do
        @purchase.token = ''
        @purchase.valid?
      end
      
      it 'postal_codeが無い時購入できない' do
        @purchase.postal_code = ''
        @purchase.valid?
      end

      it 'postal_codeに-(ハイフン)が無い時登録できない' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
      end

      it 'prefecure_idが選択されていない時購入できない' do
        @purchase.prefecure_id = 1
        @purchase.valid?
      end

      it 'muncipalitiesが無い時購入できない' do
        @purchase.muncipalities = ''
        @purchase.valid?
      end

      it 'addressが無い時購入できない' do
        @purchase.address = ''
        @purchase.valid?
      end

      it 'phone_numberが無い時購入できない' do
        @purchase.phone_number = ''
        @purchase.valid?
      end

      it 'phone_numberに-(ハイフン)がある時購入できない' do
        @purchase.phone_number = '000-0000'
        @purchase.valid?
      end
    end
  end
end
