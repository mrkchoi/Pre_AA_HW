class ChangeHouseTablesToHouses < ActiveRecord::Migration[5.2]
  def change
    rename_table :house_tables, :houses
  end
end
