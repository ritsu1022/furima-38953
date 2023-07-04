class OrdersController < ApplicationController
  def index
    @order_history = OrderHistory.new
    @item = Item.find(params[:item_id])
  end

  def new
    @item = Item.find(params[:item_id])
    @order_history = OrderHistory.new
  end

  def create
    @order_history = OrderHistory.new(order_params)
    if @order_history.valid?
      @order_history.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def order_params
    params.require(:order_history).permit(:zip, :region_id, :municipalities, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end
end
