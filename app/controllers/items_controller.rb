class ItemsController < ApplicationController
<<<<<<< HEAD
  before_action :set_items, only: [:show]

  def show
=======
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
>>>>>>> master
  end

  private

<<<<<<< HEAD
  def set_items
    @item = Item.find(params[:id])
=======
  def params_item
    params.require(:item).permit(:name, :description, :brand, :size, :color, :photo)
>>>>>>> master
  end
end
