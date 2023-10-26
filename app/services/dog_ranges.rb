class DogRanges
    include HTTParty
    base_uri 'https://anishkumbhar-dognormalranges.hf.space/dog-range?'

    def query(breed)
      response = self.class.get('/dog-range', query: { breed: breed })
      response.parsed_response
    end
  end
