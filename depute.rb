require 'nokogiri'
require 'open-uri'

def depute_page
	array = []
	page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))
	page.css("td>a").each do |x|
		array << "https://www.nosdeputes.fr/deputes#{x['href']}" 
  end
  array
end

def depute_name(url)
	array = []
	page = Nokogiri::HTML(open(url))

		array[0] << page.xpath("//*[@id="b1"]/ul[2]/li[1]/ul/li[1]/a")
		array[1] << page.xpath("//*[@id="corps_page"]/div/div[1]/div[1]/h1").split(" ")[0] 
		array[2] << page.xpath("//*[@id="corps_page"]/div/div[1]/div[1]/h1").split(" ")[1]

end 

def perform
	array = []
	url= depute_page
	url.each do |x|
		hash={}
	
		hash ["first_name"]=depute_name[1]
		hash ["last_name"]=depute_name[2]
		hash ["email"]= depute_name[0]
		array<<hash
end
p array
	end

perform























