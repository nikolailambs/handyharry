class MessagesController < ApplicationController

  def inbox

    skip_authorization
    ids = Message.select("MAX(id) AS id").group(:receiver_id).collect(&:id)
    @conversations = Message.order("created_at DESC").where(id: ids).where(sender: current_user).or(Message.order("created_at DESC").where(id: ids).where(receiver: current_user))
  end

  def index
    skip_authorization
    @message_receiver = Message.find(params[:id]).receiver
    @message_sender = Message.find(params[:id]).sender
    @messages = Message.where(receiver: @message_receiver).where(sender: current_user).or(Message.where(sender: @message_sender).where(receiver: current_user))
  end

  def show
  end

  def new
    skip_authorization
    @message = Message.new
  end

  def create
    skip_authorization
    @message = Message.new(message_params)
    @message.sender = current_user
    @message.receiver = User.find(params[:message][:receiver_id])

    if @message.save
      redirect_to conversation_path(@message)
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
