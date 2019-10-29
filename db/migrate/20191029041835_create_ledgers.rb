class CreateLedgers < ActiveRecord::Migration[5.2]
  def change
    create_table :ledgers do |t|
      t.references :user, foreign_key: true
      t.references :plant, foreign_key: true
      t.string :stripe_id

      t.timestamps
    end
  end
end
