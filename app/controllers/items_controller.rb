class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, notice:'出品できません'
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:title, :text, :kategory_id, :status_id, :delivery_fee_id, :from_id, :day_id, :price, :user)
  end
end
