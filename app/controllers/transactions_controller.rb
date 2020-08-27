class TransactionsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end


  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :kategory_id, :status_id, :delivery_fee_id, :from_id, :day_id, :price).merge(user_id: current_user.id)
  end
end

