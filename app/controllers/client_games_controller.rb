class ClientGamesController < ApplicationController
  before_action :set_client_game, only: %i[ show edit update destroy ]
  before_action :set_client

  # GET /client_games or /client_games.json
  def index
    @client_games = @client.client_games.includes(:game)
    @available_games = Game.all
  end

  # GET /client_games/1 or /client_games/1.json
  def show
  end

  # GET /client_games/new
  def new
    @client_game = ClientGame.new
    @client = Client.find(params[:client_id])

    # Проверка, передан ли game_id из параметров
    if params[:game_id]
      @client_game.game_id = params[:game_id]
    end
  end

  # GET /client_games/1/edit
  def edit
  end

  # POST /client_games or /client_games.json
  def create
    @client_game = ClientGame.new(client_game_params)
    @client = Client.find(params[:client_id])

    puts "Параметры: #{params.inspect}"

    if @client_game.save
      redirect_to client_client_games_path(@client), notice: "Игра успешно добавлена."
    else
      puts "Ошибки: #{@client_game.errors.full_messages}"
      flash[:alert] = @client_game.errors.full_messages.join(", ")
      redirect_to new_client_client_game_path(@client, game_id: @client_game.game_id)
    end
  end

  # PATCH/PUT /client_games/1 or /client_games/1.json
  def update
    respond_to do |format|
      if @client_game.update(client_game_params)
        format.html { redirect_to @client_game, notice: "Client game was successfully updated." }
        format.json { render :show, status: :ok, location: @client_game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client_game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_games/1 or /client_games/1.json
  def destroy
    @client_game.destroy!

    respond_to do |format|
      format.html { redirect_to client_games_path, status: :see_other, notice: "Client game was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_game
      @client_game = ClientGame.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_game_params
      params.require(:client_game).permit(:client_id, :game_id)
    end

    def set_client
      @client = Client.find(params[:client_id])
    end
end
