require 'net/http'

class CongressApiClient
  def initialize(api_key)
    @api_key = api_key
  end

  def fetch_reps_by_state(state_abbreviation)
    params = {
      api_key: @api_key,
      currentMember: true
    }
    uri = URI.parse(ENV['CONGRESS_GOV_API_URI'] + 'member/' + state_abbreviation + '/')
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
  end
end

