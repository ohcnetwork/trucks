class CreatePanchayats < ActiveRecord::Migration[6.0]
  def change
    create_table :panchayats do |t|
      t.string :name

      t.timestamps
    end
  end
end
