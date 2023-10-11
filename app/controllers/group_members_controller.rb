class GroupMembersController < ApplicationController

  before_action :set_group, only: %i[new create destroy]
  before_action :verify_admin, only: %i[new create]

  def new
    @group_member = GroupMember.new
    authorize @group_member
  end

  def create
    @input = params[:group_member]
    @name = @input.values[0]
    @user = User.where('lower(nickname) = ?', @name.downcase).first
    @group_member = GroupMember.new(group: @group, user: @user)
    if @group_member.save!
      redirect_to new_group_group_member_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
    authorize @group_member
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
    authorize @group
  end

  def verify_admin
    if @group.admin != current_user
      redirect_to root_path
    end
  end
end
