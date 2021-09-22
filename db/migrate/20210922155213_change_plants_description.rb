class ChangePlantsDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column(:plants, :desription, :description)
  end
end
