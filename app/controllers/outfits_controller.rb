class OutfitsController < ApplicationController
  def new
    @outfit = Outfit.new
    @items = current_user.items
  end

  def create
    @outfit = Outfit.new(params_outfit)
    @user = current_user
    @outfit.user = @user
    if @outfit.save
      ItemOutfit.create(
        outfit: @outfit,
        item: Item.find(params[:outfit][:items])
      )
      redirect_to :root

    else
      render :new
    end

    # @item_outfit = ItemOutfit.new(params_item_outfit)
    # @item_outfit.outfit = @outfit
    # if @item_outfit.save
    #   redirect_to :root
    # else
    #   render :new
    # end
  end

  private

  def params_outfit
    params.require(:outfit).permit(:description, :photo)
  end
end
