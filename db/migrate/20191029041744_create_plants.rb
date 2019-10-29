class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.integer :price
      t.string :species
      t.string :pot
      t.integer :light
      t.integer :size
      t.text :description
      t.string :postage

      t.timestamps
    end
  end
end
