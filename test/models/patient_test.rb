# == Schema Information
#
# Table name: patients
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  gender             :integer          default("male")
#  birth_certificated :boolean          default(FALSE)
#  id_type            :integer          default("id_card")
#  id_number          :string(255)
#  birthday           :date
#  remark             :text(65535)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  test 'validate presence' do
    patient = Patient.new
    assert_not patient.valid?
    assert_includes patient.errors.keys, :name
    assert_includes patient.errors.keys, :birthday

    patient.update birth_certificated: true
    assert_not patient.valid?
    assert_includes patient.errors.keys, :id_number
  end
end
