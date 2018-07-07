class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.integer :wcup_id
      t.integer :country_id
      t.integer :pot
      t.integer :group_id

      t.timestamps
    end
  end
end
