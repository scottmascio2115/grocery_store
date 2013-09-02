require 'open-uri'
require 'Nokogiri'
doc = Nokogiri::HTML(open("http://www.grantland.com/"))
p doc.search('ul.list-content').inner_text

=begin save feature in csv
 def save
    for_csv = []
    @new_ppl.each do |person|
      for_csv << "#{person.id},#{person.first_name},#{person.last_name},#{person.email},#{person.phone},#{person.created_at}"
    end
 
    CSV.open(@file, "a") do |csv|
      @new_ppl.each do |person|
        csv << for_csv
      end
    end
  end
 
end
=end
