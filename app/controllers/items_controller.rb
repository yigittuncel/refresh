class ItemsController < ApplicationController
  before_action :set_items, only: [:show]

  def show
  end

  private

  def set_items
    @item = Item.find(params[:id])
  end
end
