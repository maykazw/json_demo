require 'test_helper'

class GetDataControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get get_data_index_url
    assert_response :success
  end

end
