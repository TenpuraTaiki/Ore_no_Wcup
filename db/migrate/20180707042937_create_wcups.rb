class CreateWcups < ActiveRecord::Migration[5.1]
  def change
    create_table :wcups do |t|

      t.timestamps
    end
  end
end
