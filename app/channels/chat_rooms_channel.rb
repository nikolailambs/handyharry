class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "some_channel_#{params[:chat_room_id]}"
  end
end
