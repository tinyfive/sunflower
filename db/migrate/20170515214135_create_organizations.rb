class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.integer :category, null: false, default: 0

      t.timestamps
    end
  end
end
