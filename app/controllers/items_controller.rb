class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_items, only: [:show]

  def show
    @order = Order.new
  end

  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @item = Item.new(params_item)
    @item.user = current_user
    if @item.save
      redirect_to dashboard_path(current_user)
    else
      render :new
    end
  end

  private

  def set_items
    @item = Item.find(params[:id])
  end

  def params_item
    params.require(:item).permit(:name, :description, :brand, :size, :color, :photo)
  end
end
