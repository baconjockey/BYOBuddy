class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.integer :beer_style_id
      t.integer :pairing_descriptor_id
      t.text :reasoning

      t.timestamps
    end
  end
end
