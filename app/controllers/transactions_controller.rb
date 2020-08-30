class TransactionsController < ApplicationController

  before_action :authenticate_user!
  before_action :item_user
  
  def index
    @item = Item.find(params[:item_id])
  end


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

  def item_user
    @item = Item.find(params[:item_id])
      if @item.user_id == current_user.id 
        redirect_to root_path
      end
  end

  private

    def purchase_params
      params.permit(:postal_code, :prefecure_id, :muncipalities, :address, :building_name, :phone_number, :price, :item_id, :token).merge(user_id: current_user.id)
    end

    def pay_item
      @item = Item.find(params[:item_id])
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency:'jpy'
      )
    end
 
end

