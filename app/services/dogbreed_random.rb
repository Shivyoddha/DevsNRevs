class DogbreedRandom
  include HTTParty
  base_uri 'https://dog.ceo/api/breed'

  def random_image(breed)
    # Replace spaces with hyphens (or underscores)
    breed = breed.gsub(' ', '-')

    response = self.class.get("/#{breed}/images/random")
    JSON.parse(response.body)
  end
end
