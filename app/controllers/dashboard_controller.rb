class DashboardController < ApplicationController
  def show
    @oauth = Koala::Facebook::OAuth.new("707029629325606", "d21f35eb8fb87de7efca405847e70ffe", "localhost:3000")
    @graph = Koala::Facebook::API.new(@oauth.get_app_access_token)
    @feed = @graph.get_connections("DoctorWeb.antivirus", "feed")
  end
end
