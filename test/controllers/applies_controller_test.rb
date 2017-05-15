require 'test_helper'

class AppliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get applies_index_url
    assert_response :success
  end

end
