class HuggingFaceService
  include HTTParty
  base_uri 'https://api-inference.huggingface.co/models/HuggingFaceH4/zephyr-7b-alpha'

  def initialize
    @headers = { "Authorization" => "Bearer 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" }
  end

  def query(payload)
    response = self.class.post('', headers: @headers, body: payload.to_json, headers: { 'Content-Type' => 'application/json' })
    response.parsed_response
  end
end
