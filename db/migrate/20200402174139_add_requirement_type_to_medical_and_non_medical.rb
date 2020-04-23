class AddRequirementTypeToMedicalAndNonMedical < ActiveRecord::Migration[6.0]
  def change
    add_column :non_medical_reqs, :requirement_type, :string
    add_column :medical_reqs, :requirement_type, :string
  end
end
