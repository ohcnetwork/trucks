class AddContactsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :contacts, :user, index: true
  end
end
