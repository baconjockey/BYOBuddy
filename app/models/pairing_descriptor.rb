class PairingDescriptor < ActiveRecord::Base
  has_many :pairings
  has_many :beer_styles, :through => :pairings
  
  belongs_to :category
end