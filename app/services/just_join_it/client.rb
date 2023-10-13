module JustJoinIt
  class Client
    BASE_URL = "https://api.justjoin.it"
    OFFERS_PATH = "/v2/user-panel/offers"

    def initialize
      @client = Faraday.new(BASE_URL)
    end

    def fetch_offers
      all_offers = []
      page = 1

      loop do
        query_params = { page: page, perPage: 100 }
        headers = { "Version" => "2" }
        response = @client.get(OFFERS_PATH, query_params, headers)
        data = FastJsonparser.parse(response.body)

        # Add the offers from the current page to the collection
        all_offers.concat(data[:data])

        # Check if there are more pages to fetch
        meta = data[:meta]
        next_page = meta[:nextPage]

        break if next_page.nil?

        # Increment the page number for the next request
        page = next_page
      end

      all_offers
    rescue => e
      Rails.logger.warn "Failed to fetch offers: #{e.message}"
    end

    attr_reader :client
  end
end
