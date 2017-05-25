class CreateSocialRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :social_relations do |t|
      t.integer :relationship, null: false, default: 0
      t.string  :name
      t.string  :tel
      t.string  :employer
      t.string  :employer_tel
      t.decimal :income_amount
      t.integer :patient_id, null: false

      t.timestamps
    end
  end
end
