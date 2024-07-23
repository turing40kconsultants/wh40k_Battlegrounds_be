# require 'faraday'

class GithubService
  def self.conn
    Faraday.new(url: "https://api.github.com") 
    # do |faraday|
      # faraday.params[:api_key] = Rails.application.credentials.tmdb[:key]
    # end
  end

  def self.get_units_by_faction(faction)
    response = conn.get("/repos/BSData/wh40k-10e/contents/#{faction}")
    coded_content = JSON.parse(response.body)

    decoded_xml_content = Base64.decode64(coded_content['content'])
    # decoded_xml_content = decode_64(coded_content['content'])
    json_content = xml_to_json(decoded_xml_content)
    JSON.parse(json_content, symbolize_names: true)
    # binding.pry
  end


  def self.xml_to_json(content)
          # Parse the decoded XML content
          xml_doc = Nokogiri::XML(content)

          # Convert the XML to a hash
          xml_hash = Hash.from_xml(xml_doc.to_s)
    
          # Convert the hash to JSON
          json_output = xml_hash.to_json
  end

#   def self.get_slamanders
#     # URL to fetch the JSON response
#     url = 'https://api.github.com/repos/BSData/wh40k-10e/contents/Imperium%20-%20Salamanders.cat?ref=main'

#     # Make the HTTP request using Faraday
#     response = Faraday.new.get(url)

#     if response.success?
#       # Parse the JSON response
#       parsed_response = JSON.parse(response.body)

#       # Decode the base64 content
#       base64_content = parsed_response['content']
#       decoded_content = Base64.decode64(base64_content)

#       # Parse the decoded XML content
#       xml_doc = Nokogiri::XML(decoded_content)

#       # Convert the XML to a hash
#       xml_hash = Hash.from_xml(xml_doc.to_s)

#       # Convert the hash to JSON
#       json_output = xml_hash.to_json

#       a = JSON.parse(json_output, symbolize_names: true)
# binding.pry

#     end
#   end
end