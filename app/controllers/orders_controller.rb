class OrdersController < ApplicationController
  before_action :move_to_sessions_new, only: [:index]
  before_action :set_item, only: [:index, :create]

  def index
    if current_user.id == @item.user.id
      redirect_to root_path and return
    end
    if user_signed_in? && @item.order.present?
      redirect_to root_path and return
    end
    @order = UserOrder.new
  end

  def create
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :lot_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token], 
      currency: 'jpy'
    )
  end


  def move_to_sessions_new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])


end
