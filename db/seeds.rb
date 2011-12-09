Category.destroy_all
["Main Ingredient", "Cuisine", "Spice"].each { |category| Category.create :name => category }

# Create Main Ingredients (to be renamed pairing_descriptors) 
PairingDescriptor.destroy_all
["Seafood", "Beef", "Pork", "Lamb", "Chicken", "Game", "Dessert"].each { |ingredient| PairingDescriptor.create :name => ingredient, :category => Category.first }

# Create Cuisines
["American", "Japanese"].each { |cuisine| PairingDescriptor.create :name => cuisine, :category => Category.find_by_name('Cuisine') }

# Create Beer Styles
BeerStyle.destroy_all
["Pilsner", "White Beer", "Gueze", "Fruit Beer", "Pale Ale", "Saison"].each { |style| BeerStyle.create :name => style }


# Create Pairings
# Main Ingredient pairings are real!  Hooray!
Pairing.destroy_all
Pairing.create :beer_style => BeerStyle.find_by_name('Pilsner'), :pairing_descriptor => PairingDescriptor.find_by_name('Seafood')
Pairing.create :beer_style => BeerStyle.find_by_name('White Beer'), :pairing_descriptor => PairingDescriptor.find_by_name('Seafood')
Pairing.create :beer_style => BeerStyle.find_by_name('Gueze'), :pairing_descriptor => PairingDescriptor.find_by_name('Lamb')
Pairing.create :beer_style => BeerStyle.find_by_name('Gueze'), :pairing_descriptor => PairingDescriptor.find_by_name('Chicken')
Pairing.create :beer_style => BeerStyle.find_by_name('Fruit Beer'), :pairing_descriptor => PairingDescriptor.find_by_name('Game')
Pairing.create :beer_style => BeerStyle.find_by_name('Fruit Beer'), :pairing_descriptor => PairingDescriptor.find_by_name('Dessert')
Pairing.create :beer_style => BeerStyle.find_by_name('Pale Ale'), :pairing_descriptor => PairingDescriptor.find_by_name('Beef')
Pairing.create :beer_style => BeerStyle.find_by_name('Pale Ale'), :pairing_descriptor => PairingDescriptor.find_by_name('Seafood')
Pairing.create :beer_style => BeerStyle.find_by_name('Saison'), :pairing_descriptor => PairingDescriptor.find_by_name('Beef')
Pairing.create :beer_style => BeerStyle.find_by_name('Saison'), :pairing_descriptor => PairingDescriptor.find_by_name('Pork')
Pairing.create :beer_style => BeerStyle.find_by_name('Saison'), :pairing_descriptor => PairingDescriptor.find_by_name('Lamb')

# Association proxy
# BeerStyle.find_by_name('Saison').pairings.create(:pairing_descriptor => PairingDescriptor.find_by_name('Lamb'))

# A couple of dummy cuisine pairings
Pairing.create :beer_style => BeerStyle.find_by_name('Saison'), :pairing_descriptor => PairingDescriptor.find_by_name('Japanese')
Pairing.create :beer_style => BeerStyle.find_by_name('Saison'), :pairing_descriptor => PairingDescriptor.find_by_name('American')
Pairing.create :beer_style => BeerStyle.find_by_name('White Beer'), :pairing_descriptor => PairingDescriptor.find_by_name('Japanese')