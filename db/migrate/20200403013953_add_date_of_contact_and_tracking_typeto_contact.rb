class AddDateOfContactAndTrackingTypetoContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :date_of_contact, :date
    add_column :contacts, :tracking_type, :string
  end
end
