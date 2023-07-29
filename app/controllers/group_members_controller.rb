class GroupMembersController < ApplicationController

  before_action :set_group, only: %i[new create destroy]

  def new
    @group_member = GroupMember.new
  end

  def create
    @group_member = GroupMember.new
    @group_member.group = @group
    @input = params[:group_member]
    @name = @input.values[0]
    @user = User.find_by_nickname(@name)
    @group_member.user = @user
    if @group_member.save!
      redirect_to new_group_group_member_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @group_member = GroupMember.find(params[:id])
    @group_member.destroy
    redirect_to new_group_group_member_path(@group)
  end

  private

  def params_group_member
    params.require(:group_member).permit(:group, :user)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end
