require 'net/http'
require 'json'
 
f = File.new("output.txt", 'w')

$i = 650
$num = 720
while $i < $num  do
	url = "https://pokeapi.co/api/v2/pokemon/#{$i}/"
	uri = URI(url)
	response = Net::HTTP.get(uri)
	parsed_response = JSON.parse(response)
	name = parsed_response['species']['name']
	sorted_types = parsed_response['types'].reverse
	types = ""
	sorted_types.each do |t|
	  types += t['type']['name']
	  types += " ".ljust(3) 
	end
	image_path = "/Users/jotadiaz/dev/gitstuff/Pokemon-Terminal/Images/Generation VI - Kalos/" + $i.to_s + ".jpg"
	puts image_path
	# Now get the image light-dark threshold
	threshold = `convert "#{image_path}" -colorspace Gray -format "%[fx:image.mean]" info:`
	f << "#{name}".ljust(12) + "#{threshold}".ljust(11) + "#{types}\n"
   $i +=1
end
f.close