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

  def trades
    @sent_orders = Order.where("buyer_id = ?", current_user).order('updated_at DESC')
    @received_orders = Order.where("seller_id = ?", current_user).order('updated_at DESC')
  end
end
