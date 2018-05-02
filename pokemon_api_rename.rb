require 'net/http'
require 'json'
 
pokemonterminal_path = "path/to/pokemonterminal/images"

$i = 712
$num = 720
#$num = 651
while $i < $num  do
	url = "https://pokeapi.co/api/v2/pokemon/#{$i}/"
	uri = URI(url)
	response = Net::HTTP.get(uri)
	parsed_response = JSON.parse(response)
	name = parsed_response['name']
	puts "#{$i} - #{name}"
	File.rename("#{pokemonterminal_path}/Pokemon-Terminal/Images/Generation VI - Kalos/" + name + ".jpg", "#{pokemonterminal_path}/Pokemon-Terminal/Images/Generation VI - Kalos/" + $i.to_s + ".jpg")
    $i +=1
end