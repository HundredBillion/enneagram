require 'test_helper'

class EnneagramNumbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enneagram_number = enneagram_numbers(:one)
  end

  test "should get index" do
    get enneagram_numbers_url
    assert_response :success
  end

  test "should get new" do
    get new_enneagram_number_url
    assert_response :success
  end

  test "should create enneagram_number" do
    assert_difference('EnneagramNumber.count') do
      post enneagram_numbers_url, params: { enneagram_number: { enneagram_number: @enneagram_number.enneagram_number } }
    end

    assert_redirected_to enneagram_number_url(EnneagramNumber.last)
  end

  test "should show enneagram_number" do
    get enneagram_number_url(@enneagram_number)
    assert_response :success
  end

  test "should get edit" do
    get edit_enneagram_number_url(@enneagram_number)
    assert_response :success
  end

  test "should update enneagram_number" do
    patch enneagram_number_url(@enneagram_number), params: { enneagram_number: { enneagram_number: @enneagram_number.enneagram_number } }
    assert_redirected_to enneagram_number_url(@enneagram_number)
  end

  test "should destroy enneagram_number" do
    assert_difference('EnneagramNumber.count', -1) do
      delete enneagram_number_url(@enneagram_number)
    end

    assert_redirected_to enneagram_numbers_url
  end
end
