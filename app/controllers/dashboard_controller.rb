class DashboardController < ApplicationController
  def show
    conn = Faraday.new(
      url: 'https://api.github.com'
    )
    response = Faraday.get("https://api.github.com/user/repos", {}, {"Authorization": "token #{current_user.token}" })

    @repos = JSON.parse(response.body, symbolize_names: true)
  end
end
