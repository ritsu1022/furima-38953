class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :new, :create]

  def index
    @order_history = OrderHistory.new

    move_to_top
  end

  def new
    @order_history = OrderHistory.new
  end

  def create
    @order_history = OrderHistory.new(order_params)
    if @order_history.valid?
      pay_item
      @order_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def order_params
    params.require(:order_history).permit(:zip, :region_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_top
    if @item.user_id == current_user.id || @item.history != nil
      redirect_to root_path
    end
  end

end
