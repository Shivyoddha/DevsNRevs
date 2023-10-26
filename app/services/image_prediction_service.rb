class ImagePredictionService
  include HTTParty
  base_uri 'https://anishkumbhar-dogdiseasepredictor.hf.space'

  def predict_image(image)
    # Use the 'body' parameter to send the image as multipart form data
    response = self.class.post('/predict', body: { input: image }, headers: { "accept" => "application/json" })
    handle_response(response)
  end

  private

  def handle_response(response)
    if response.success?
      JSON.parse(response.body)
    else
      Rails.logger.error("Prediction request failed with status #{response.code}: #{response.body}")
      raise StandardError, "Prediction request failed with status #{response.code}"
    end
  end
end
