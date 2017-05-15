class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.integer :gender
      t.boolean :birth_certificated
      t.integer :id_type
      t.string :id_number
      t.date :birthday
      t.text :remark

      t.timestamps
    end
  end
end
