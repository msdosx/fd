class DashboardController < ApplicationController
  def index
    user_signed_in?? (path = user_path(current_user)) : (path = dashboard_show_path)

    redirect_to path
  end

  def show
  end
end
