class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :continent_id
      t.string :japanese
      t.integer :fifarank

      t.timestamps
    end
  end
end
