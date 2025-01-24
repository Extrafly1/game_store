require "application_system_test_case"

class ClientGamesTest < ApplicationSystemTestCase
  setup do
    @client_game = client_games(:one)
  end

  test "visiting the index" do
    visit client_games_url
    assert_selector "h1", text: "Client games"
  end

  test "should create client game" do
    visit client_games_url
    click_on "New client game"

    click_on "Create Client game"

    assert_text "Client game was successfully created"
    click_on "Back"
  end

  test "should update Client game" do
    visit client_game_url(@client_game)
    click_on "Edit this client game", match: :first

    click_on "Update Client game"

    assert_text "Client game was successfully updated"
    click_on "Back"
  end

  test "should destroy Client game" do
    visit client_game_url(@client_game)
    click_on "Destroy this client game", match: :first

    assert_text "Client game was successfully destroyed"
  end
end
