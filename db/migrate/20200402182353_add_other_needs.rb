class AddOtherNeeds < ActiveRecord::Migration[6.0]
  def change
    add_column :non_medical_reqs, :other_needs, :string
    add_column :medical_reqs, :other_needs, :string
  end
end
