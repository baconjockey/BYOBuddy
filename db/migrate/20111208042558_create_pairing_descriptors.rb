class CreatePairingDescriptors < ActiveRecord::Migration
  def change
    create_table :pairing_descriptors do |t|
      t.string :name
      t.integer :category_id

      t.timestamps
    end
  end
end
