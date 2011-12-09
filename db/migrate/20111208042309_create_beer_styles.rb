class CreateBeerStyles < ActiveRecord::Migration
  def change
    create_table :beer_styles do |t|
      t.string :name
      t.string :aka
      t.string :country_of_origin
      t.string :sample_brands

      t.timestamps
    end
  end
end
