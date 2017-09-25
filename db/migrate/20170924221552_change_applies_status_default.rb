class ChangeAppliesStatusDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :applies, :status, 0
    change_column_null :applies, :status, false
  end
end
