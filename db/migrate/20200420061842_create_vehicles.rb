class CreateVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.references :application, null: false, foreign_key: true
      t.string :number_plate

      t.timestamps
    end
  end
end
