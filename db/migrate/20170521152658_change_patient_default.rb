class ChangePatientDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :patients, :gender, 0
    change_column_default :patients, :id_type, 0
  end
end
