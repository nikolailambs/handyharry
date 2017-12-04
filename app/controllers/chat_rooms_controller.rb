class ChatRoomsController < ApplicationController

  def index
    skip_authorization
    @chat_rooms = policy_scope(ChatRoom).includes(:messages).order("messages.created_at")
  end

  def show
    skip_authorization
    @chat_room = ChatRoom.includes(messages: :user).find(params[:id])
    @chat_room.messages.each do |m|
      m.user.has_read_message = true
      m.user.save
    end
  end

  def new
    skip_authorization
    @chat_room = ChatRoom.new
  end

  def create
    skip_authorization
    @chat_room = ChatRoom.new
    @chat_room.handy = User.find(params[:chat_room][:handy_id])
    @chat_room.client = User.find(params[:chat_room][:client_id])
    @chat_room.name = {handy: @chat_room.handy, client: @chat_room.client}

    if current_user.handy
      if ChatRoom.all.where(handy_id: current_user.id).exists?(client_id: params[:chat_room][:client_id])
        user_chat_room = ChatRoom.all.where(handy_id: current_user.id).where(client_id: params[:chat_room][:client_id])[0].id
        redirect_to chat_room_path(user_chat_room), :flash => { :alert => "Chat already exists" }
      else
        if @chat_room.save
          redirect_to chat_room_path(@chat_room)
        else
          render 'new'
        end
      end
    else
      if ChatRoom.all.where(client_id: current_user.id).exists?(handy_id: params[:chat_room][:handy_id])
        user_chat_room = ChatRoom.all.where(client_id: current_user.id).where(handy_id: params[:chat_room][:handy_id])[0].id
        redirect_to chat_room_path(user_chat_room), :flash => { :alert => "Chat already exists" }
      else
        if @chat_room.save
          redirect_to chat_room_path(@chat_room)
        else
          render 'new'
        end
      end
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name, :handy_id, :client_id)
  end
end
