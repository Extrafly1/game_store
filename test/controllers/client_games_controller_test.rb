require "test_helper"

class ClientGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_game = client_games(:one)
  end

  test "should get index" do
    get client_games_url
    assert_response :success
  end

  test "should get new" do
    get new_client_game_url
    assert_response :success
  end

  test "should create client_game" do
    assert_difference("ClientGame.count") do
      post client_games_url, params: { client_game: {} }
    end

    assert_redirected_to client_game_url(ClientGame.last)
  end

  test "should show client_game" do
    get client_game_url(@client_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_client_game_url(@client_game)
    assert_response :success
  end

  test "should update client_game" do
    patch client_game_url(@client_game), params: { client_game: {} }
    assert_redirected_to client_game_url(@client_game)
  end

  test "should destroy client_game" do
    assert_difference("ClientGame.count", -1) do
      delete client_game_url(@client_game)
    end

    assert_redirected_to client_games_url
  end
end
