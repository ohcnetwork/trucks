class AddBasicTablesForTruck < ActiveRecord::Migration[6.0]
  def change
    # drop_table :vehicles
    # drop_table :applications
    # drop_table :calls
    # drop_table :contacts
    # drop_table :health_reports
    # drop_table :houses
    # drop_table :ports

    create_table :vehicles do |t|
      t.string :number
      t.string :type
      t.timestamps
    end

    create_table :entries do |t|
      t.references :vehicle
      t.references :user
      t.string :number_of_driver
      t.string :name_of_driver
      t.string :status
      t.timestamps
    end
  end
end
