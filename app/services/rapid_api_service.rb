require 'uri'
require 'net/http'
require 'openssl'

class RapidApiService
  API_KEY = "e4d0ad322dmsh5e2c6237dd38e43p195729jsn1475d2cb3aa0"
  HOST = "imdb8.p.rapidapi.com"

  def find_by_title(title)
    response = http_request(find_by_title_endpoint + "/?q=#{title}")
    response["results"]
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
    response = http.request(request)
    JSON.parse(response.body)
  end

  def find_by_title_endpoint
    source_url + '/title/find'
  end

  def source_url
    "https://#{HOST}"
  end
end
