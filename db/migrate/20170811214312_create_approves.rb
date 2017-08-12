class CreateApproves < ActiveRecord::Migration[5.0]
  def change
    create_table :approves do |t|
      t.integer :creator_id
      t.text :remark
      t.decimal :aid_amount

      t.timestamps
    end
  end
end
