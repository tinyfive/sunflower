class Approval < ApplicationRecord
  enum category: { volunteer: 0, radio: 1, fund: 2 }
  enum status: { passed: 0, rejected: 1 }

  belongs_to :creator, class_name: 'User'
  belongs_to :apply

  validates_presence_of :creator_id, :remark

  after_save :update_apply_status

  private

  def update_apply_status
    if passed?
      apply.update status: "#{category}_approved"
    else
      apply.update status: :rejected
    end
  end
end
