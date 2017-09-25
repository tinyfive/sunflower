class RenameApprovesIntoApprovals < ActiveRecord::Migration[5.0]
  def change
    rename_table :approves, :approvals
  end
end
