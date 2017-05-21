class Apply < ApplicationRecord
  ESTIMATE_DISCHARGE_START_YEAR = Date.today.year - 1
  ESTIMATE_DISCHARGE_END_YEAR = Date.today.year + 2
  
  belongs_to :patient
  belongs_to :hospital, -> { where(category: :hospital) }, foreign_key: :hospital_id, class_name: Organization.name

  accepts_nested_attributes_for :patient, allow_destroy: false, limit: 1

  validates_presence_of :patient, :hospital
end
