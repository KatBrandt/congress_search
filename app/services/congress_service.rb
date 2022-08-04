class CongressService
  def self.members_of_house(state = 'CO')
    response = conn.get("/congress/v1/members/house/#{state}/current.json")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.propublica.org") do |faraday|
      faraday.headers["X-API-KEY"] = Rails.application.credentials.dig(:PROPUBLICA_API_KEY)
    end
  end
end
