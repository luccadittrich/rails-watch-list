require 'json'
require 'net/http'

url = 'https://db.ygoprodeck.com/api/v7/cardinfo.php'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

data.each do |key, value|
  i = 0
  11980.times do
    i += 1
    Card.create! name: value[i]['name'], image_url: "https://images.ygoprodeck.com/images/cards/#{value[i]['id']}.jpg"
  end
end
