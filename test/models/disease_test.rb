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
  # test "the truth" do
  #   assert true
  # end
end
