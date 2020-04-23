class ChangeTypeofNotAble < ActiveRecord::Migration[6.0]
  def change
    remove_column :non_medical_reqs, :not_able
    add_column :non_medical_reqs, :not_able_type, :string
    remove_column :medical_reqs, :not_able
    add_column :medical_reqs, :not_able_type, :string
  end
end
