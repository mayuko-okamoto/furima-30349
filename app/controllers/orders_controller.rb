class OrdersController < ApplicationController
  before_action :move_to_sessions_new, only: [:index]

  def index
    @order = UserOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserOrder.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :lot_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def move_to_sessions_new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  # def move_to_root_path
  #   if

  # end

  # def

  # end

end
