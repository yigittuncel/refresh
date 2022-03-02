class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:feed]

  def feed
    @outfits = Outfit.all.order('created_at DESC')
    @users = User.all
  end

  def dashboard
    @user = current_user
    @outfits = current_user.outfits
    @items = current_user.items
  end
end
