class Zoopla
  include HTTParty
  base_uri 'api.zoopla.co.uk/api/v1/'
  default_params :output => 'json', :api_key => '4zygpw9taptacn88vwkrvtka', :radius => 5, :page_size => 10, :listing_status => "sale", :minimum_price => 100000, :maximum_price => 10000000
  format :json
  
  
  
  def self.find_local_properties(postcode)
    @property_id = Random.rand(0...9)
    response = get('property_listings.json', :query => {:postcode => postcode})
    if response.success?
      @property_data = response
    else
      raise response.response
    end
  end
  
  def self.find_local_property_image
    if @property_data != nil
      @property_data["listing"][@property_id]["image_url"]
    else
      raise @property_data.body
    end
  end
  
  def self.find_local_property_price
    if @property_data != nil
       @property_data["listing"][@property_id]["price"].to_i
    else
      raise @response.body
    end
  end
  
  def self.calculate_random_price
    if find_local_property_price != 0
      randprice = rand_price(find_local_property_price)
    else
      randprice = "POA"
    end
  end
  
  def self.rand_price(seed)  
    hi = seed + percent(seed, 0.3)
    lo = seed - percent(seed, 0.3)
    result = (Random.rand(lo...hi) / 1000).round * 1000
    
  end
  
  def self.percent(seed, base)
    if seed != 0
      result = seed * base
    else
      seed
    end
  end
  
end
