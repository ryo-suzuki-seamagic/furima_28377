class TransactionsController < ApplicationController

  before_action :authenticate_user!
  before_action :item_user
  
  def index
    @item = Item.find(params[:item_id])
  end

  # def new
  #   @purchase = PurchaseAddress.new 
  # end

  def create
    
    @purchase = PurchaseAddress.new(purchase_params)
    if  @purchase.valid?
      pay_item
        @purchase.save
      return redirect_to root_path
    else
      render "index"
    end

  end
  
  private

  def item_user
    @item = Item.find(params[:item_id])
      if @item.user_id == current_user.id 
        redirect_to root_path
      end
  end

    def purchase_params
      params.require(:purchase_address).permit(:postal_code, :prefecure_id, :muncipalities, :address, :building_name, :phone_number, :price, :token )
    end

    def pay_item
      Payjp.api_key = 
      Payjp::Charge.create(
        amount: purchase_params[:price],
        card: purchase_params[:token],
        currency:'jpy'
      )
    end
 
end

