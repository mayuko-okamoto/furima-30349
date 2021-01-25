class OrdersController < ApplicationController

  def index
    @user_order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture_id, :city, :lot_number, :building_name, :phone)
  end

end
