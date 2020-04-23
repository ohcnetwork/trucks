class ChangeFamilyMembersToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :contacts, :number_of_family_members
    add_column :contacts, :number_of_family_members, :integer
  end
end
