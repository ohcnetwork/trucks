class AddTravellerDetailstoContacts < ActiveRecord::Migration[6.0]
  def change
    change_table(:contacts) do |t|
      t.string :passport_number
      t.string :alternate_contact
      t.references :application
    end
  end
end
