class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:feed]

  def feed
    @outfits = Outfit.all.order('created_at DESC')
    @users = User.all
  end
end
