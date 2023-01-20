require "application_system_test_case"

class CountdownsTest < ApplicationSystemTestCase
  setup do
    @countdown = countdowns(:one)
  end

  test "visiting the index" do
    visit countdowns_url
    assert_selector "h1", text: "Countdowns"
  end

  test "should create countdown" do
    visit countdowns_url
    click_on "New countdown"

    fill_in "Description", with: @countdown.description
    fill_in "Name", with: @countdown.name
    fill_in "Target", with: @countdown.target
    click_on "Create Countdown"

    assert_text "Countdown was successfully created"
    click_on "Back"
  end

  test "should update Countdown" do
    visit countdown_url(@countdown)
    click_on "Edit this countdown", match: :first

    fill_in "Description", with: @countdown.description
    fill_in "Name", with: @countdown.name
    fill_in "Target", with: @countdown.target
    click_on "Update Countdown"

    assert_text "Countdown was successfully updated"
    click_on "Back"
  end

  test "should destroy Countdown" do
    visit countdown_url(@countdown)
    click_on "Destroy this countdown", match: :first

    assert_text "Countdown was successfully destroyed"
  end
end
