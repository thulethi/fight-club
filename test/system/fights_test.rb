require "application_system_test_case"

class FightsTest < ApplicationSystemTestCase
  setup do
    @fight = fights(:one)
  end

  test "visiting the index" do
    visit fights_url
    assert_selector "h1", text: "Fights"
  end

  test "creating a Fight" do
    visit fights_url
    click_on "New Fight"

    fill_in "Loser", with: @fight.loser
    fill_in "Winner", with: @fight.winner
    click_on "Create Fight"

    assert_text "Fight was successfully created"
    click_on "Back"
  end
end
