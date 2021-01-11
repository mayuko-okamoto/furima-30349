class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

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
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :detail, :price, :category_id, :condition_id, :shipping_payer_id,
                                 :prefecture_id, :storage_date_id).merge(user_id: current_user.id)
  end
end