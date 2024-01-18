class WishesController < ApplicationController

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

  def update
  end

  def destroy
  end

  private

  def params_wish
    params.require(:wish).permit(:content, :wishlist)
  end

end
