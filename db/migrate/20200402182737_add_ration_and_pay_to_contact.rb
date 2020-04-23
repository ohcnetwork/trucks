class AddRationAndPayToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :willing_to_pay, :boolean
    add_column :contacts, :ration_type, :string
  end
end
