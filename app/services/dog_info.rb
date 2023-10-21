class DogInfo
  include HTTParty
  base_uri 'https://anishkumbhar-doginfo.hf.space'

  def query(breed)
    response = self.class.get('/food', query: { breed: breed })  # Use '/food' endpoint and 'breed' query parameter
    response.parsed_response
  end
end
