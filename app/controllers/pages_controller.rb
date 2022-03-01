class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:feed]

  def feed
    @items = Item.all
    @outfits = Outfit.all
  end
end
