require 'uri'
require 'net/http'
require 'openssl'

class RapidApiService
  # For this app setting the credentials here but it could move to .env file for security purposes.
  API_KEY = "e4d0ad322dmsh5e2c6237dd38e43p195729jsn1475d2cb3aa0"
  HOST = "imdb8.p.rapidapi.com"

  # For this demo app I have added only one endpoint to find moive by title if we can expand this class by creating multiple endpoints like find actor and all
  def find_by_title(title)
    return unless title.present?

    response = http_request(find_by_title_endpoint + "/?q=#{title}")
    response["results"].select{|result| result["titleType"] == 'movie'}
  end

  private

  def http_request(url)
    url = URI(url)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = API_KEY
    request["X-RapidAPI-Host"] = HOST
    begin
      response = http.request(request)
      JSON.parse(response.body)
    rescue
      {"results" => []}
    end
  end

  def find_by_title_endpoint
    source_url + '/title/find'
  end

  def source_url
    "https://#{HOST}"
  end
end
