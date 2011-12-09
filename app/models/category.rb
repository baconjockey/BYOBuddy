class Category < ActiveRecord::Base
  has_many :pairing_descriptors
end
