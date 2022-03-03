class OrdersController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    order = Order.new(
      desired_item: @item,
      offered_item: Item.find(params[:order][:offered_item][0]),
      seller: @item.user,
      buyer: current_user
    )
    if order.save
      redirect_to :root
    else
      render "items/show"
    end
  end

  def update
    @order = Order.find()
  end

  def confirm

  end

  def reject

  end

  private

  def params_order
    params.require(:order).permit(:name, :description, :brand, :size, :color, :photo, :order)
  end
end
