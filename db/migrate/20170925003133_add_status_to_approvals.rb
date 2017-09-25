class AddStatusToApprovals < ActiveRecord::Migration[5.0]
  def change
    add_column :approvals, :status, :integer, null: false, default: 0, after: :creator_id
  end
end
