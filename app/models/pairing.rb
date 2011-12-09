class Pairing < ActiveRecord::Base
  belongs_to :beer_style
  belongs_to :pairing_descriptor
end
