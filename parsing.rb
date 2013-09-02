require 'open-uri'
require 'Nokogiri'
doc = Nokogiri::HTML(open("http://www.grantland.com/"))
p doc.search('ul.list-content').inner_text

