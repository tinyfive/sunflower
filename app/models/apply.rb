# == Schema Information
#
# Table name: applies
#
#  id                     :integer          not null, primary key
#  patient_id             :integer
#  creator_id             :integer
#  archive_number         :integer
#  status                 :integer
#  insured                :boolean
#  commercial_insured     :boolean
#  hospital_id            :integer
#  expense_amount         :decimal(10, )
#  affordable_amount      :decimal(10, )
#  hospital_advice_amount :decimal(10, )
#  estimate_discharge_at  :date
#  reason                 :text(65535)
#  once_applied           :boolean
#  once_applied_remark    :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Apply < ApplicationRecord
  acts_as_paranoid

  ESTIMATE_DISCHARGE_START_YEAR = Date.today.year - 1
  ESTIMATE_DISCHARGE_END_YEAR = Date.today.year + 2

  enum status: { draft: 0, submitted: 1, volunteer_approved: 2, radio_approved: 3, fund_approved: 4, rejected: 9 }

  belongs_to :patient
  belongs_to :hospital, -> { where(category: :hospital) }, foreign_key: :hospital_id, class_name: Organization.name
  belongs_to :disease
  has_many :approvals

  accepts_nested_attributes_for :patient, allow_destroy: false, limit: 1

  delegate :name, to: :hospital, prefix: true, allow_nil: true

  validates_presence_of :patient, :hospital, :disease

  ransacker :created_at, type: :date do
    Arel.sql('date(created_at)')
  end
end
