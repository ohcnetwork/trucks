class CreateMedicalReqs < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_reqs do |t|
      t.belongs_to :contact, null: false, foreign_key: true
      t.boolean :need_medicines
      t.boolean :fullfilled

      t.timestamps
    end
  end
end
