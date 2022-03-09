class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:feed, :dashboard]

  def feed
    @outfits = Outfit.all.order('created_at DESC')
    @users = User.all
    if user_signed_in?
      @people_you_may_like = User.where("id != ?", current_user.id)
    else
      @people_you_may_like = User.first(4)
    end
  end

  def dashboard
    @user = User.find(params[:id])
    @outfits = @user.outfits
    @items = @user.items
  end

  def trades
    @sent_orders = Order.where("buyer_id = ?", current_user).order('updated_at DESC')
    @received_orders = Order.where("seller_id = ?", current_user).order('updated_at DESC')
  end
end
