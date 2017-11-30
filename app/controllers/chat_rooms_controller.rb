class ChatRoomsController < ApplicationController

  def index
    skip_authorization
    @chat_rooms = policy_scope(ChatRoom)
  end

  def show
    skip_authorization
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
  end

  def new
    skip_authorization
    @chat_room = ChatRoom.new
  end

  def create
    skip_authorization
    @chat_room = ChatRoom.new(chat_room_params)

    if @chat_room.save
      redirect_to chat_room_path(@chat_room)
    else
      render 'new'
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
