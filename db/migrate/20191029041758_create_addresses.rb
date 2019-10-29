class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :address
      t.string :suburb
      t.string :state
      t.string :postcode

      t.timestamps
    end
  end
end
