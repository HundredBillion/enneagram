require "application_system_test_case"

class EnneagramScoresTest < ApplicationSystemTestCase
  setup do
    @enneagram_score = enneagram_scores(:one)
  end

  test "visiting the index" do
    visit enneagram_scores_url
    assert_selector "h1", text: "Enneagram Scores"
  end

  test "creating a Enneagram score" do
    visit enneagram_scores_url
    click_on "New Enneagram Score"

    fill_in "Enneagram five score", with: @enneagram_score.enneagram_five_score
    fill_in "Enneagram four score", with: @enneagram_score.enneagram_four_score
    fill_in "Enneagram nine score", with: @enneagram_score.enneagram_nine_score
    fill_in "Enneagram one score", with: @enneagram_score.enneagram_one_score
    fill_in "Enneagram seven score", with: @enneagram_score.enneagram_seven_score
    fill_in "Enneagram six score", with: @enneagram_score.enneagram_six_score
    fill_in "Enneagram three score", with: @enneagram_score.enneagram_three_score
    fill_in "Enneagram two score", with: @enneagram_score.enneagram_two_score
    fill_in "Enneagream eight score", with: @enneagram_score.enneagream_eight_score
    click_on "Create Enneagram score"

    assert_text "Enneagram score was successfully created"
    click_on "Back"
  end

  test "updating a Enneagram score" do
    visit enneagram_scores_url
    click_on "Edit", match: :first

    fill_in "Enneagram five score", with: @enneagram_score.enneagram_five_score
    fill_in "Enneagram four score", with: @enneagram_score.enneagram_four_score
    fill_in "Enneagram nine score", with: @enneagram_score.enneagram_nine_score
    fill_in "Enneagram one score", with: @enneagram_score.enneagram_one_score
    fill_in "Enneagram seven score", with: @enneagram_score.enneagram_seven_score
    fill_in "Enneagram six score", with: @enneagram_score.enneagram_six_score
    fill_in "Enneagram three score", with: @enneagram_score.enneagram_three_score
    fill_in "Enneagram two score", with: @enneagram_score.enneagram_two_score
    fill_in "Enneagream eight score", with: @enneagram_score.enneagream_eight_score
    click_on "Update Enneagram score"

    assert_text "Enneagram score was successfully updated"
    click_on "Back"
  end

  test "destroying a Enneagram score" do
    visit enneagram_scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enneagram score was successfully destroyed"
  end
end
