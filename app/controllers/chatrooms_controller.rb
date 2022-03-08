class ChatroomsController < ApplicationController
  def index
    @orders = Order.where("buyer_id = ? OR seller_id = ?", current_user, current_user).where(status: 1)

    @chatrooms = []
    @orders.each do |order|
      @chatrooms << order.chatroom
    end
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
