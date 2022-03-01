class ItemsController < ApplicationController
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

  def params_item
    params.require(:item).permit(:name, :description, :brand, :size, :color, :photo)
  end
end
