class AddCreatorToOrganizations < ActiveRecord::Migration[5.0]
  def change
    add_column :organizations, :creator_id, :integer, after: :category
  end
end
