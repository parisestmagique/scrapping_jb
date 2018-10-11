require 'nokogiri'
require 'open-uri'


def get_the_email_of_a_townhal_from_its_webpage(webpage)
    page = Nokogiri::HTML(open(webpage))
    return page.css("td")[7].text
end

#puts get_the_email_of_a_townhal_from_its_webpage

def get_all_the_urls_of_val_doise_townhalls
    hash = {}
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page.css("a.lientxt").each do |x|
        hash[x.text] = "http://annuaire-des-mairies.com/#{x['href']}"
    end
    return hash
end

#puts get_all_the_urls_of_val_doise_townhalls

def get_all_the_emails_of_val_doise_townhalls
    h = {}
    hash = get_all_the_urls_of_val_doise_townhalls
    hash.each do |o, p|
        h[o] = get_the_email_of_a_townhal_from_its_webpage (p)
    end
    return h
end

puts get_all_the_emails_of_val_doise_townhalls