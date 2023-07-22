class GroupMembersController < ApplicationController

  def new
    @group_member = GroupMember.new
    @group = Group.find(params[:group_id])
  end

  def create
    @user = User.find_by_nickname(params[:user])
    @group_member = GroupMember.new(params_group_member)
    @group = Group.find(params[:group_id])
    @group_member.group = @group
    if @group_member.save!
      redirect_to group_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_group_member
    params.require(:group_member).permit(:group, :user)
  end

end
