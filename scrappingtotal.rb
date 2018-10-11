require 'open-uri'
require 'nokogiri'   


def get_cities
	get_page ||= Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	@liste_cities = []
	cities = get_page.css('.lientxt').each do |name_city|
			
	@liste_cities << name_city.text
end
end
get_cities

def change_space 
@cities_name = []
@liste_cities.each do |name_v|
	@cities_name << name_v.downcase.gsub(/[ ]/, '-')	
end 
end 
change_space

def create_url
base_url = "http://annuaire-des-mairies.com/95/"
@url_list = []
	@cities_name.each do |url_name|
		@url_list << base_url+ url_name +".html"
	end
end 
create_url

def get_the_email_of_a_townhal_from_its_webpage 
	@email_cities = []
		@url_list.each do |x|
		get_page =  Nokogiri::HTML(open(x))
		@email_cities << get_page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
	end
#puts @email_cities
end
get_the_email_of_a_townhal_from_its_webpage


 total = @cities_name.zip(@email_cities)
 total.each do |name_town,email_town|
 p " NAme : #{name_town} Email: #{email_town}"
end
