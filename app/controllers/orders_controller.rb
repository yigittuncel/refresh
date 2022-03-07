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
      redirect_to :root, info: "You have have successfully made your offer"
    else
      render "items/show"
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(params_order)

    if @order.status == "confirmed"
      @chatroom = Chatroom.create(
        order: @order
      )
    end

    respond_to do |format|
      format.html { redirect_to trades_path }
      format.text { render partial: "shared/order_card", locals: { order: @order }, formats: [:html] }
    end
  end

  def show
  end

  private

  def params_order
    params.require(:order).permit(:name, :description, :brand, :size, :color, :photo, :order, :status)
  end
end
