class RemoveCreatorFromOrganizationAndDisease < ActiveRecord::Migration[5.0]
  def change
    remove_column :organizations, :creator_id
    remove_column :diseases, :creator_id
  end
end
