class GroupsController < ApplicationController

  def index
    @groups = current_user.groups.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      respond_to do |format|
        # format.html { redirect_to group_messages_path(@group) }
        format.json { @group }
      end
    end
  end

  private
  def group_params
    params.require(:group).permit({ talker_ids: [] })
  end
end
