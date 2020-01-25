require 'test_helper'

class EnneagramScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enneagram_score = enneagram_scores(:one)
  end

  test "should get index" do
    get enneagram_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_enneagram_score_url
    assert_response :success
  end

  test "should create enneagram_score" do
    assert_difference('EnneagramScore.count') do
      post enneagram_scores_url, params: { enneagram_score: { enneagram_five_score: @enneagram_score.enneagram_five_score, enneagram_four_score: @enneagram_score.enneagram_four_score, enneagram_nine_score: @enneagram_score.enneagram_nine_score, enneagram_one_score: @enneagram_score.enneagram_one_score, enneagram_seven_score: @enneagram_score.enneagram_seven_score, enneagram_six_score: @enneagram_score.enneagram_six_score, enneagram_three_score: @enneagram_score.enneagram_three_score, enneagram_two_score: @enneagram_score.enneagram_two_score, enneagream_eight_score: @enneagram_score.enneagream_eight_score } }
    end

    assert_redirected_to enneagram_score_url(EnneagramScore.last)
  end

  test "should show enneagram_score" do
    get enneagram_score_url(@enneagram_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_enneagram_score_url(@enneagram_score)
    assert_response :success
  end

  test "should update enneagram_score" do
    patch enneagram_score_url(@enneagram_score), params: { enneagram_score: { enneagram_five_score: @enneagram_score.enneagram_five_score, enneagram_four_score: @enneagram_score.enneagram_four_score, enneagram_nine_score: @enneagram_score.enneagram_nine_score, enneagram_one_score: @enneagram_score.enneagram_one_score, enneagram_seven_score: @enneagram_score.enneagram_seven_score, enneagram_six_score: @enneagram_score.enneagram_six_score, enneagram_three_score: @enneagram_score.enneagram_three_score, enneagram_two_score: @enneagram_score.enneagram_two_score, enneagream_eight_score: @enneagram_score.enneagream_eight_score } }
    assert_redirected_to enneagram_score_url(@enneagram_score)
  end

  test "should destroy enneagram_score" do
    assert_difference('EnneagramScore.count', -1) do
      delete enneagram_score_url(@enneagram_score)
    end

    assert_redirected_to enneagram_scores_url
  end
end
