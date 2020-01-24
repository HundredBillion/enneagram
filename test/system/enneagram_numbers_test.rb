require "application_system_test_case"

class EnneagramNumbersTest < ApplicationSystemTestCase
  setup do
    @enneagram_number = enneagram_numbers(:one)
  end

  test "visiting the index" do
    visit enneagram_numbers_url
    assert_selector "h1", text: "Enneagram Numbers"
  end

  test "creating a Enneagram number" do
    visit enneagram_numbers_url
    click_on "New Enneagram Number"

    fill_in "Enneagram number", with: @enneagram_number.enneagram_number
    click_on "Create Enneagram number"

    assert_text "Enneagram number was successfully created"
    click_on "Back"
  end

  test "updating a Enneagram number" do
    visit enneagram_numbers_url
    click_on "Edit", match: :first

    fill_in "Enneagram number", with: @enneagram_number.enneagram_number
    click_on "Update Enneagram number"

    assert_text "Enneagram number was successfully updated"
    click_on "Back"
  end

  test "destroying a Enneagram number" do
    visit enneagram_numbers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enneagram number was successfully destroyed"
  end
end
