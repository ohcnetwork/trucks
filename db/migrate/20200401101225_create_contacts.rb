class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :gender
      t.integer :age
      t.string :house_name
      t.integer :ward
      t.string :landmark

      t.timestamps
    end
    add_index :contacts, :phone, unique: true
  end
end
