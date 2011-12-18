class AddColumnToBeerStyle < ActiveRecord::Migration
  def self.up
     add_column :beer_styles, :image, :string
   end

   def self.down
     remove_column :beer_styles, :image
   end
end
