class PublicPagesController < ApplicationController

  def show
    @group_member = GroupMember.find(params[:id])
    @user = @group_member.user

    authorize @group_member
  end
end
