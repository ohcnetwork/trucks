class AddPanchayatToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :panchayat, index: true
  end
end
