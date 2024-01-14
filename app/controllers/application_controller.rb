class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  # Pundit: allow-list approach
  after_action :verify_authorized, except: :home, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :home, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "Vous n'avez pas les autorisations pour faire ça."
  #   redirect_to(root_path)
  # end

  def autocomplete_user_nickname
    term = params[:term]
    items = User.where('nickname ILIKE ?', "%#{term}%").map(&:nickname)
    render json: items
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
