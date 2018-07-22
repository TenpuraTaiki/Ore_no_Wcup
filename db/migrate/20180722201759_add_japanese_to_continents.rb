class AddJapaneseToContinents < ActiveRecord::Migration[5.1]
  def change
    add_column :continents, :japanese, :string
  end
end
