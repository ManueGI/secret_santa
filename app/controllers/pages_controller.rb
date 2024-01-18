class PagesController < ApplicationController

  def profile
    @wish = Wish.new
    @wishlist = current_user.wishlist
  end

end
