class OutfitsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :set_outfits, only: [:show]

  def show
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(params_outfit)
    @outfit.user = current_user
    if @outfit.save
      items_array = params[:outfit][:items]
      items_array.each { |id| ItemOutfit.create(outfit: @outfit, item: Item.find(id)) } if items_array.present?
      redirect_to :root
    else
      render :new
    end
  end

  private

  def set_outfits
    @outfit = Outfit.find(params[:id])
  end

  def params_outfit
    params.require(:outfit).permit(:description, :photo)
  end
end
