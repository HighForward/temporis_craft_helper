require 'json'
argv = ARGV

if argv.length == 0
  lvl = gets.chomp.to_i
else
  lvl = argv
end


# puts lvl

file_lvl = File.read('lvl.json')
file_card = File.read('carte.json')
data_card_hash = JSON.parse(file_card)
data_lvl_hash = JSON.parse(file_lvl)


i = 0
array = Array.new
lvl_current = lvl.first.to_i
last = lvl.last.to_i


while lvl_current <= last

  lvl_hash = data_lvl_hash[lvl_current]
  # BOUCLE SUR CHAQUE CARTE DU NIVEAU SPECIFIER

  puts "ITEM : RESSOURCE pour le level #{lvl_current}"
  lvl_hash['cards'].each do |id|

    # CHERCHER DANS LE CARD_HASH LA CARTE CORRESPONDANTE
    data_card_hash['indexDB'].each do |item|

      # SI LA CARTE EXISTE, ADD OBTENTION TO ARRAY
      if item['id'] == id
        array[i] = {name: item['name'], obt: item['obt']}
        break
      end
    end
    puts array
  end
  lvl_current += 1
end