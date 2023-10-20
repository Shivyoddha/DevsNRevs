class DogFood
  include HTTParty
  base_uri 'https://anishkumbhar-text-generation.hf.space'

  def query(activity, weight)
    response = self.class.get('/calculate-food', query: { activity: activity, weight: weight })
    response.parsed_response
  end
end
