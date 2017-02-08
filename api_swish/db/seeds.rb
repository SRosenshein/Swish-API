require 'nokogiri'

f = File.open(File.join(Rails.root, 'db', 'bball_courts.xml'))
doc = Nokogiri::XML(f)
f.close

all_courts = []

doc.css('facility').each do |node|
    children = node.children
    
    name = children.css('Name').inner_text
    address = children.css('Location').inner_text + ', NY, New York'
    lat = children.css('lat').inner_text
    long = children.css('lon').inner_text
    
    all_courts << {
        name: name,
        description: "description",
        status: "no status",
        address: address,
        latitude: lat,
        longitude: long
    }
end

Court.create(all_courts)

