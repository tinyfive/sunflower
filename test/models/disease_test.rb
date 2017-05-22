# == Schema Information
#
# Table name: diseases
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  creator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class DiseaseTest < ActiveSupport::TestCase
  test 'validate presence' do
    disease = Disease.new
    assert_not disease.valid?
    assert_includes disease.errors.keys, :name
    assert_includes disease.errors.keys, :creator
  end
end
