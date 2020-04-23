class AddMoreFieldsToApplication < ActiveRecord::Migration[6.0]
  def change
    create_table :ports do |t|
      t.string :name
      t.string :type
    end

    change_table(:applications) do |t|
      t.string :flight_number
      t.datetime :arrival_on
      t.string :port_of_departure
      t.string :alternate_contact
      t.references :port
      t.timestamps
    end
  end
end
