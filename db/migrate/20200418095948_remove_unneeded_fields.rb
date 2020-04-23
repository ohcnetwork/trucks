class RemoveUnneededFields < ActiveRecord::Migration[6.0]
  def change
    drop_table :applications
    drop_table :non_medical_reqs
    drop_table :medical_reqs
    drop_table :travellers
  end
end
