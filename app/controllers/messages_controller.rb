class MessagesController < ApplicationController

  def create
    skip_authorization
    @message = Message.new(message_params)
    @chat_room = ChatRoom.find(params[:chat_room_id])
    @message.chat_room = @chat_room
    @message.user = current_user

    # defining a task if the content has a @
    if @message.content.include? "@"
      task_array = @message.content.split(" ")
      from = /^@/
      index_project = task_array.index{|e| e.match(from)}
      project = Project.where(title: task_array[index_project].gsub(/\W+/, '').capitalize ).where(handy_id: "#{@chat_room.handy_id}").where(client_id: "#{@chat_room.client_id}")
      task_array = task_array.slice((index_project+1)..(task_array.length-1))
      task = task_array.join(" ")
      new_task = Task.new(description: task)
      new_task.project = project.first
      new_task.save
    end

    if @message.save
      respond_to do |format|
        # format.html { redirect_to chat_room_path(@chat_room) }
        format.js
      end
    else
      respond_to do |format|
        # format.html { render "chat_rooms/show" }
        format.js
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :read)
  end
end
