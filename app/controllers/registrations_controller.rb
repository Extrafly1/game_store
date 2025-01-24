class RegistrationsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      session[:client_id] = @client.id # Сохраняем ID клиента в сессии
      redirect_to client_games_path, notice: "Регистрация успешна!"
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :password, :password_confirmation) # Убедитесь, что у вас есть поля для пароля
  end
end