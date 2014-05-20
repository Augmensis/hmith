class Zoopla
  include HTTParty
  base_uri 'api.zoopla.co.uk/api/v1/'
  default_params :output => 'json', :api_key => '4zygpw9taptacn88vwkrvtka', :radius => '1', :page_size => '1', :listing_status => 'sale', :minimum_price => '10000'
  format :json
  
  def self.find_local_properties(postcode)
    response = get('property_listings.json', :query => {:postcode => postcode})
    if response.success?
      response
    else
      raise response.response
    end
  end
  
  def self.find_local_property_image(postcode)
    response = get('property_listings.json', :query => {:postcode => postcode})
    if response.success?
      response["listing"][0]["image_url"]
    else
      raise response.response
    end
  end
  
  
  
end
