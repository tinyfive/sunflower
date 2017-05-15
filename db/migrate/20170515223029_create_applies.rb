class CreateApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :applies do |t|
      t.integer :patient_id
      t.integer :creator_id
      t.integer :archive_number
      t.integer :status
      t.boolean :insured
      t.boolean :commercial_insured
      t.integer :hospital_id
      t.decimal :expense_amount
      t.decimal :affordable_amount
      t.decimal :hospital_advice_amount
      t.date :estimate_discharge_at
      t.text :reason
      t.boolean :once_applied
      t.string :once_applied_remark

      t.timestamps
    end
  end
end
