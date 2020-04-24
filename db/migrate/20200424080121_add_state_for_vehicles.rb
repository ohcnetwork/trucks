class AddStateForVehicles < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :name
      t.timestamps
    end

    add_reference :entries, :state
  end
end
