class WishesController < ApplicationController
  before_action :set_wish, only: %i[edit update destroy]

  def new
    @wish = Wish.new
    authorize @wish
  end

  def create
    @wish = Wish.new(params_wish)
    @wish.wishlist = current_user.wishlist
    if @wish.save!
      redirect_to profile_path
    else
      render :profile, status: :unprocessable_entity
    end
    authorize @wish
  end

  def edit
  end

  def update
    @wish.update(params_wish)
    redirect_to profile_path
    authorize @wish
  end

  def destroy
    @wish.destroy
    redirect_to profile_path
    authorize @wish
  end

  private
  def set_wish
    @wish = Wish.find(params[:id])
  end

  def params_wish
    params.require(:wish).permit(:content, :wishlist)
  end

end
