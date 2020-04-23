class AddApplicationTable < ActiveRecord::Migration[6.0]
  def change
    create_table :applications, force: :cascade do |t|
      t.references :user
      t.references :port
      t.string :flight_number
      t.datetime :arrival_on
      t.string :port_of_departure
      t.string :alternate_contact
      t.timestamps
    end
    add_reference :health_reports, :contact, index: true
    remove_reference :health_reports, :traveller
  end
end
