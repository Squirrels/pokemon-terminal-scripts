# Pokemon Terminal Scripts

Scripts used to process names and images for [Pokemon Terminal](https://github.com/LazoCoder/Pokemon-Terminal).

The scripts are written in ruby.

## The scripts are dirty and not commented, since they were just created to parse data quickly

## pokemon_api.rb

Used to add the pokemon data to the .txt file by connecting to [pokeapi](https://pokeapi.co).

### Usage
 Requires a folder for the new generation being added. It's currently configured to add generation 6, Kalos.
 To run it, just do:
 ```bash
  ruby pokemon_api.rb
  ```
 

## pokemon_api_rename.rb

Used to rename the images to the correct name for the pokemon

### Usage
 Requires setting the variable pokemonterminal_path to the path of the Pokemon Terminal containing folder. It's currently configured to add generation 6, Kalos.
 To run it, just do:
 ```bash
  ruby pokemon_api_rename.rb
  ```
## pokemon_to_json.rb

Used to convert the .txt file to .json, adding the names in multiple languages (obtained from [sindresorhus/pokemon](https://github.com/sindresorhus/pokemon)]

### Usage
 Requires setting the variable pokemonterminal_path to the path of the Pokemon Terminal containing folder. Also requires cloning sindresorhus' repository to the pokemon folder, and moving the pokemon.txt data as input.txt to the root folder.
 To run it, just do:
 ```bash
  ruby pokemon_to_json.rb
  ```
