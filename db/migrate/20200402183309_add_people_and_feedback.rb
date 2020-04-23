class AddPeopleAndFeedback < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :feedback, :string
    add_column :contacts, :number_of_family_members, :string
  end
end
