class FetchJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Faraday.new("https://justjoin.it/api/offers")
  end
end
