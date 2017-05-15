class Apply < ApplicationRecord
  belongs_to :patient
  belongs_to :hospital, foreign_key: :hospital_id, class_name: Organization.name

  accepts_nested_attributes_for :patient, allow_destroy: false, limit: 1

  validates_presence_of :patient, :hospital
end
