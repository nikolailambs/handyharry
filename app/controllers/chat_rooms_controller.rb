class ChatRoomsController < ApplicationController

  def index
    skip_authorization
    @chat_rooms = policy_scope(ChatRoom).includes(:messages).order("messages.created_at")
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
    @chat_room = ChatRoom.new
    @chat_room.name = name_to_hash_method
    @chat_room.handy = User.find(params[:chat_room][:handy_id])
    @chat_room.client = User.find(params[:chat_room][:client_id])

    if ChatRoom.where(handy_id: params[:chat_room][:handy_id]).where(client_id: params[:chat_room][:client_id])
      redirect_to chat_rooms_path, :flash => { :alert => "Chat already exists" }
    else
      if @chat_room.save
        redirect_to chat_room_path(@chat_room)
      else
        render 'new'
      end
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name, :handy, :client)
  end

  def name_to_hash_method
    chat_room_name = { client_id: params[:chat_room][:client_id], handy_id: params[:chat_room][:client_id] }
  end
end
