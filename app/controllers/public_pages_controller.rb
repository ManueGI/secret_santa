class PublicPagesController < ApplicationController

  def index
    @users = policy_scope(User)
    # if params[:query].present?
    #   @group_member = @group_member.where
    # end
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
