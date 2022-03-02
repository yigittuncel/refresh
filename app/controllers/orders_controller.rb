class OrdersController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    order = Order.new(
      desired_item: @item,
      offered_item: Item.find(params[:order][:offered_item][0]),
      user: current_user
    )
    if order.save
      redirect_to :root
    else
      render "items/show"
    end
  end
end
