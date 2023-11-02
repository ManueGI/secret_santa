class PublicPagesController < ApplicationController

  def index
    @users = policy_scope(User)
    if params[:query].present?
      @users = @users.where("nickname ILIKE ?", "%#{params[:query]}%")
    end
    authorize @users
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
