class SessionsController < ApplicationController
  def new
  end

  def create
    @client = Client.find_by(name: params[:name]) # Находим клиента по имени
    if @client && @client.authenticate(params[:password]) # Проверяем пароль
      session[:client_id] = @client.id # Сохраняем ID клиента в сессии
      redirect_to client_client_games_path(client_id: @client.id), notice: "Вход выполнен успешно!" # Передаем @client для правильного маршрута
    else
      flash.now[:alert] = "Неверное имя или пароль"
      render :new
    end
  end

  def destroy
    session[:client_id] = nil # Удаляем ID клиента из сессии
    redirect_to root_path, notice: "Вы вышли из системы."
  end
end
