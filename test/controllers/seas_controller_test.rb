require 'test_helper'

class SeasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get seas_index_url
    assert_response :success
  end

end
