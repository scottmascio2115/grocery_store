require 'open-uri'
require 'Nokogiri'
doc = Nokogiri::HTML(open("http://www.grantland.com/"))
p doc.search('ul.list-content').inner_text

def save
     CSV.open(@file, 'wbgi') do |csv|
    @people.each do |person|
      csv << [person.id, person.first_name, person.last_name, person.email, person.created_at]
      end
    end
  end
