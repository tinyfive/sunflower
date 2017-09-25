class AddCategoryToApproves < ActiveRecord::Migration[5.0]
  def change
    add_column :approves, :category, :integer, null: false, default: 0, after: :creator_id
  end
end
