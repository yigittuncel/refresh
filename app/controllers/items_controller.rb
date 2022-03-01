class ItemsController < ApplicationController
  before_action :set_items, only: [:show]

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @user = current_user
    @item = Item.new(params_item)
    @item.user = current_user
    if @item.save
      redirect_to :root
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
