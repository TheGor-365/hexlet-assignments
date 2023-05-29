# frozen_string_literal: true
require "test_helper"

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulletins_url
    assert_response :success
  end

  test "should get show" do
    @bulletine = bulletins(:one)

    get bulletine_url(@bulletine)
    assert_response :success
  end
end
