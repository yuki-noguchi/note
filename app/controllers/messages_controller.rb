class MessagesController < ApplicationController
  before_action :set_group
  def index
    @message = Message.new
    respond_to do |format|
      format.html { group_messages_path(@group) }
      format.json { @new_messages = @group.messages.where('id > ?', params[:message][:id]) }
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        # format.html { redirect_to group_messages_path(@group) }
        format.json
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :id).merge(talker_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = current_user.groups.find(params[:group_id])
  end
end
