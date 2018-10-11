
require 'open-uri'
require 'nokogiri'   

def get_cities
	get_page ||= Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	@liste_cities = []
	cities = get_page.css('.lientxt').each do |name_city|
			
	@liste_cities << name_city.text
end
return @liste_cities
end
p get_cities



