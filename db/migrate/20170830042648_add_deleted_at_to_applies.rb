class AddDeletedAtToApplies < ActiveRecord::Migration[5.0]
  def change
    add_column :applies, :deleted_at, :datetime
    add_index :applies, :deleted_at
  end
end
