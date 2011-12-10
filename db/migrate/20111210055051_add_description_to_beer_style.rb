class AddDescriptionToBeerStyle < ActiveRecord::Migration
  def self.up
     add_column :beer_styles, :description, :text
   end

   def self.down
     remove_column :beer_styles, :description
   end
end
