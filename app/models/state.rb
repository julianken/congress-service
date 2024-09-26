class State < ApplicationRecord
  has_many :representatives

  def fetch_representatives
    congress_api_client.fetch_reps_by_state(abbreviation)
  end

  def congress_api_client
    @congress_api_client ||= CongressApiClient.new(ENV['CONGRESS_GOV_API_KEY'])
  end
end

