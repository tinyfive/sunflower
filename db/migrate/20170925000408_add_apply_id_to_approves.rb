class AddApplyIdToApproves < ActiveRecord::Migration[5.0]
  def change
    add_reference :approves, :apply, foreign_key: true, null: false, after: :creator_id
  end
end
