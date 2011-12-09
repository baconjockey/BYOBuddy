class BeerStyle < ActiveRecord::Base
  has_many :pairings
  has_many :pairing_descriptors, :through => :pairings
end
