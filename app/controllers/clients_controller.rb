class ClientsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: "Клиент успешно создан." }
        format.json { render :show, status: :created, location: @client }
      else
        # Вывод ошибок в консоль для отладки
        puts "Ошибки: #{@client.errors.full_messages}"
        
        # Отображение ошибок пользователю
        flash.now[:alert] = @client.errors.full_messages.join(", ")
        format.html { render :new, status: :unprocessable_entity } # Возвращаемся к форме создания клиента
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_path, status: :see_other, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def replenish_balance
    amount = params[:amount].to_f
    client_id = params[:client_id]  # Получаем client_id из параметров
    @client = Client.find(client_id)  # Находим клиента по идентификатору
    if amount > 0
      @client.update(balance: @client.balance + amount)
      if @client.save
        respond_to do |format|
          format.js { flash.now[:notice] = "Баланс успешно пополнен на #{number_to_currency(amount, unit: 'руб.')}" }
        end
      else
        respond_to do |format|
          format.js { flash.now[:alert] = "Ошибка при пополнении баланса." }
        end
      end
    else
      respond_to do |format|
        format.js { flash.now[:alert] = "Сумма пополнения должна быть положительной." }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "Клиент не найден."
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name, :email, :balance, :password, :password_confirmation)
    end
end
