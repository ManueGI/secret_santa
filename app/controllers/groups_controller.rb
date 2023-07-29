class GroupsController < ApplicationController
  before_action :set_group, only: %i[show edit update destroy]

  def index
    @user = current_user
    @groups = @user.groups
  end

  def show
    @members = @group.group_members
    @santa_assignement = SantaAssignement.where(group: Group.find(params[:id]), giver_id: current_user)[0]
    unless @santa_assignement.nil?
      @receiver = User.find(@santa_assignement.receiver_id)
    end
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params_group)
    @user = current_user
    @group_member = GroupMember.new(group: @group, user: @user)
    @group_member.save!
    if @group.save!
      redirect_to new_group_group_member_path(@group)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @group.update(params_group)
    redirect_to group_path(@group)
  end

  def destroy
    @group.destroy
    redirect_to profile_path
  end

  private

  def params_group
    params.require(:group).permit(:name)
  end

  def params_group_member
    params.require(:group_member).permit(:group, :user)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
