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
      items_array = params[:outfit][:items]
      items_array.each do |id|
        ItemOutfit.create(
          outfit: @outfit,
          item: Item.find(id)
        )
      end
      redirect_to :root
    else
      render :new
    end
  end

  private

  def params_outfit
    params.require(:outfit).permit(:description, :photo)
  end
end
