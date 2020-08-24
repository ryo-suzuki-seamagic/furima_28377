require 'rails_helper'

describe Item do
  before do 
  @item = FactoryBot.build(:item)
  @item.image = fixture_file_upload('public/images/test_image.png')
  end


  describe '新規出品' do
   context "出品がうまく行く時" do
      it "imageなどすべての項目がある時出品できる" do
        expect(@item).to be_valid
      end
      it "priceが300円以上の時出品できる" do
        price = 300
        expect(@item).to be_valid
      end
      it "priceが9999999円以下の時出品できる" do
        price = 9999999
        expect(@item).to be_valid
      end
    end

    context "出品ができない時" do
      it "imageがないと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "titleが無いと出品できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")

      end
      it "textがないと出品できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")

      end
      it "kategoryが選択されてないと出品できない" do
        @item.kategory_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Kategory Select")

      end
      it "statusが選択されてないと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")

      end
      it "fromが選択されてないと出品できない" do
        @item.from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("From Select")

      end
      it "delivery_feeが選択されてないと出品できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")

      end
      it "dayが選択されてないと出品できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")

      end
      it "priceがないと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")

      end
      it "priceが299円以下の時出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
        
      end
      it "priceが10000000以上の時出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
        
      end

    end
   end
end
