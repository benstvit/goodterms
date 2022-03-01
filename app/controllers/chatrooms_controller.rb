class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
  end

  def create
  end
end
