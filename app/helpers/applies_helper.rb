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

module AppliesHelper
  def apply_status_color(apply)
    case apply.status
    when 'draft' then 'default'
    when 'fund_approved' then 'success'
    when 'rejected' then 'danger'
    else 'warning'
    end
  end
end
