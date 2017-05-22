class ChangeDefaultForPatients < ActiveRecord::Migration[5.0]
  def change
    change_column_default :patients, :birth_certificated, 0
  end
end
