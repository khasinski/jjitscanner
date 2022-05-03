class FetchJob < ApplicationJob
  queue_as :default

  def perform
    offers = JustJoinIt::Client.new.fetch_offers
    offers.each do |offer|
      JustJoinIt::UpdateOffer.new(offer).call
    end
  end
end
