class AddPanchayatFeedbacktoContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :panchayat_feedback, :text
  end
end
