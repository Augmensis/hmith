json.array!(@houses) do |house|
  json.extract! house, :id, :location, :realprice, :fakeprice1, :fakeprice2
  json.url house_url(house, format: :json)
end
