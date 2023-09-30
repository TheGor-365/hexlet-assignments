require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletins_url

    assert_select 'h1', 'Bulletins'
    assert_response :success
  end

  test "should get show" do
    @bulletin = bulletins(:one)

    get bulletin_url(@bulletin)

    assert_select 'h1', 'Title 1'
    assert_select 'p', 'Body 1'
    assert_response :success
  end
end
