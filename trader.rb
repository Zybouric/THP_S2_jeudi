require 'open-uri'
require 'nokogiri'   


def get_crypto_name
	get_page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	@liste_crypto = []
	@price_crypto = []
	get_page.css('//a').each do |v|
		if v.to_s.include?('"currency-name-container link-secondary"')
			@liste_crypto <<  v.text
		elsif v.to_s.include?('"price"')
			@price_crypto << v.text
		end
	end
cacat = Hash[@liste_crypto.zip(@price_crypto)]
end
p get_crypto_name



