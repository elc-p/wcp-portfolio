require 'base64'
require 'json'
require 'net/https'

module Translation
  class << self
    def get_translate_data(tag_text)
      # APIのURL作成
      api_url = "https://translation.googleapis.com/language/translate/v2?key=#{ENV['GOOGLE_API_KEY']}"


      # APIリクエスト用のJSONパラメータ
      params = {
        "q": "#{tag_text}",
        "source": "en",
        "target": "ja",
        "format": "text"
      }.to_json

      # Google Cloud Vision APIにリクエスト
      uri = URI.parse(api_url)
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['Content-Type'] = 'application/json'
      response = https.request(request, params)
      response_body = JSON.parse(response.body)
      # APIレスポンス出力
      # if (error = response_body['responses'][0]['error']).present?
      #   raise error['message']
      # else
        response_body['data']['translations'][0]['translatedText']
      # end
    end
  end
end