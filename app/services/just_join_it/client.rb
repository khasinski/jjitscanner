module JustJoinIt
  class Client
    BASE_URL = "https://justjoin.it"
    OFFERS_PATH = "/api/offers"

    def initialize
      @client = Faraday.new(BASE_URL)
    end

    def fetch_offers
      response = @client.get(OFFERS_PATH)
      FastJsonparser.parse(response.body)
    rescue => e
      Rails.logger.warn "Failed to fetch offers: #{e.message}"
    end

    attr_reader :client
  end
end