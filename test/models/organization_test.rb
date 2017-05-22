# == Schema Information
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  category   :integer          default("hospital"), not null
#  creator_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test 'validate presence' do
    organization = Organization.new
    assert_not organization.valid?
    assert_includes organization.errors.keys, :name
    assert_includes organization.errors.keys, :creator
  end
end
