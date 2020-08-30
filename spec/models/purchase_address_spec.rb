require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_address)
  end

  describe '購入機能' do
    context '購入がうまくいく時' do
      it '建物名以外のすべての項目がある時購入できる' do
        expect(@purchase).to be_valid
      end
    end

    context '購入がうまくいかない時' do
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
    end
  end
end
