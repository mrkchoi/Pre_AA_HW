class AddHouseIdToCats < ActiveRecord::Migration[5.2]
  def change
    add_column :cats, :house_id, :Integer
  end
end
