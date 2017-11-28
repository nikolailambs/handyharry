class MessagesController < ApplicationController

  def inbox
    ids = Message.select("MAX(id) AS id").group(:receiver_id).collect(&:id)
    @conversations = Message.order("created_at DESC").where(id: ids).where(sender: current_user).or(Message.order("created_at DESC").where(id: ids).where(receiver: current_user))
  end

  def index
    @message_receiver = Message.find(params[:id]).receiver
    @message_sender = Message.find(params[:id]).sender
    @messages = Message.where(receiver: @message_receiver).where(sender: current_user).or(Message.where(sender: @message_sender).where(receiver: current_user))
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:message][:receiver_id])

    if @message.save
      redirect_to inbox_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:title, :content, :sender_id, :receiver_id)
  end
end
