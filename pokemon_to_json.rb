require 'net/http'
require 'json'
require 'pry'

# Prepare output
output = File.new("pokemon.json", 'w')

# Load languages
loaded_languages = []
en_pokemon = JSON.parse(File.read("pokemon/data/en.json"))

available_languages = ["de", "fr", "ja", "ko", "ru", "zh-Hans", "zh-Hant"]
available_languages.each do |language|
	loaded_languages << {code: language, data: JSON.parse(File.read("pokemon/data/#{language}.json"))}
end

# Load txt input
json_pokemon = []
File.readlines('input.txt').each_with_index do |line, index|
	#
	number = index + 1
	pokemon_data = line.split()
	name = pokemon_data[0]
	dark_threshold = pokemon_data[1]
	types = {}
	types[:primary] = pokemon_data[2]
	unless pokemon_data[3].nil?
		types[:secondary] = pokemon_data[3]
	end

	languages = {}
	# For each of the valid languages
	language_index = en_pokemon.find_index(name.capitalize)
	if language_index.nil?
		if name == "nidoran-m"
			language_index = en_pokemon.find_index("Nidoran♂")
		elsif name == "nidoran-f"
			language_index = en_pokemon.find_index("Nidoran♀")
		elsif name == "mr.mime"
			language_index = en_pokemon.find_index("Mr. Mime")
		elsif name == "farfetch'd"
			language_index = en_pokemon.find_index("Farfetch’d")
		elsif name == "ho-oh"
			language_index = en_pokemon.find_index("Ho-Oh")
		elsif name == "mimejr"
			language_index = en_pokemon.find_index("Mime Jr.")
		elsif name == "porygon-z"
			language_index = en_pokemon.find_index("Porygon-Z")
		else
			binding.pry
		end
	end
	loaded_languages.each do |language|
		languages["#{language[:code]}"] = "#{language[:data][language_index].downcase}"
	end
	json_pokemon << {
		number: number,
		name: name,
		dark_threshold: dark_threshold,
		types: types,
		languages: languages
	}
end
# Write it
File.open("pokemon.json", 'w') { |file| file.write(JSON.pretty_generate(json_pokemon)) }