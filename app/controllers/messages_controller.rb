class MessagesController < ApplicationController


  def inbox
    @messages = Message.all.where(sender_id: current_user)
  end

  def index
    @messages = Message.all.where(sender_id: current_user).where(receiver_id: params[:id])
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
      redirect_to messages_path
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
