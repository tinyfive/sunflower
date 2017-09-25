class AddDiseaseIdToApplies < ActiveRecord::Migration[5.0]
  def change
    add_reference :applies, :disease, foreign_key: true, after: :patient_id
  end
end
