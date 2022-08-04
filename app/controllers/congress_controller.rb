class CongressController < ApplicationController
  def index
    # state = params[:state]
    conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = Rails.application.credentials.dig(:PROPUBLICA_API_KEY)
    end

    response = conn.get("/congress/v1/members/house/CO/current.json")

    data = JSON.parse(response.body, symbolize_names: true)
    @members = data[:results].map do |member_data|
      Member.new(member_data)
    end
    render 'congress/index'
  end
end
