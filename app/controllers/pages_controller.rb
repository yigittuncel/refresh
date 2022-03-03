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
    @orders = current_user.orders
    @sent_orders = Order.where("user_id = ?", current_user)
    @received_orders = Order.where.not("user_id = ?", current_user)
  end
end
