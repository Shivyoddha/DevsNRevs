class HumanAge
    include HTTParty
    base_uri 'https://anishkumbhar-dog-years.hf.space/calculate-human-years?'

    def query(weight, dogyears)
      response = self.class.get('/calculate-food', query: { weight: weight, dogyears: dogyears })
      response.parsed_response
    end
  end
