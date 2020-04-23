class RenameToSingluar < ActiveRecord::Migration[6.0]
  def change
    rename_column :calls, :contacts_id, :contact_id
    rename_column :calls, :users_id, :user_id
  end
end
