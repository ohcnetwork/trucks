class AddNotAbletoRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :non_medical_reqs, :not_able, :boolean
    add_column :medical_reqs, :not_able, :boolean
  end
end
