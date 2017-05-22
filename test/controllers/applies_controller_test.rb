# == Schema Information
#
# Table name: applies
#
#  id                     :integer          not null, primary key
#  patient_id             :integer
#  creator_id             :integer
#  archive_number         :integer
#  status                 :integer
#  insured                :boolean
#  commercial_insured     :boolean
#  hospital_id            :integer
#  expense_amount         :decimal(10, )
#  affordable_amount      :decimal(10, )
#  hospital_advice_amount :decimal(10, )
#  estimate_discharge_at  :date
#  reason                 :text(65535)
#  once_applied           :boolean
#  once_applied_remark    :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'test_helper'

class AppliesControllerTest < ActionDispatch::IntegrationTest
  attr_reader :apply

  def setup
    sign_in users(:admin)
    @apply = applies(:one)
  end

  test 'should get index' do
    get applies_url
    assert_response :success
  end

  test 'should get show' do
    get apply_url(apply)
    assert_response :success
  end

  test 'should get new' do
    get new_apply_url
    assert_response :success
  end

  test 'should get create' do
  end
end
