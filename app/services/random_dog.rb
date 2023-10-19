class RandomDog
  include HTTParty
   base_uri 'https://random.dog'

   def self.get_random_image
     response = get('/woof.json')
     if response.code == 200
       json_response = JSON.parse(response.body)
       json_response['url']
     else
       nil
     end
   end

end
