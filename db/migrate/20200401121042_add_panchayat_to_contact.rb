class AddPanchayatToContact < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :panchayat, index: true
  end
end
