/html/body/div[2]/div/div[1]/div[2]/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/arequire 'open-uri'
require 'nokogiri'   

def get_the_email_of_a_townhal_from_its_webpage 
#aller a la page web suivante

	@directory = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
#stocker le resultat dans un array/ liste
	list_email = []
	#recupere la donnee qui se trouve a cet endroit la 
		@directory.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email|
		#l'ajouter a la variable list
		list_email << email.text
		end	
	return list_email
end
#lancer le module
p get_the_email_of_a_townhal_from_its_webpage 
