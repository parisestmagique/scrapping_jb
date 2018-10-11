require 'nokogiri'
require 'open-uri'

def crypto_name
	array_name=[]
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page.css("td.currency-name").each do |x|
    array_name << x["data-sort"]
  end
  array_name
end

#puts crypto_name

def crypto_value
	array_value=[]
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	page.css("a.price").each do |y|
		array_value << y["data-usd"]
	end 
	array_value
end
#puts crypto_value

 puts Hash[crypto_name.zip(crypto_value)]
