# == Schema Information
#
# Table name: social_relations
#
#  id            :integer          not null, primary key
#  relationship  :integer          default("father"), not null
#  name          :string(255)
#  tel           :string(255)
#  employer      :string(255)
#  employer_tel  :string(255)
#  income_amount :decimal(10, )
#  patient_id    :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class SocialRelationTest < ActiveSupport::TestCase
  test 'validate presence' do
    social_relation = SocialRelation.new
    assert_not social_relation.valid?
    assert_includes social_relation.errors.keys, :patient_id
    assert_includes social_relation.errors.keys, :name
  end
end
