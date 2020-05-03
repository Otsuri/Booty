require 'test_helper'

class TtagsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get ttags_edit_url
    assert_response :success
  end

end
