class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :desription
      t.integer :days_to_harvest

      t.timestamps
    end
  end
end
