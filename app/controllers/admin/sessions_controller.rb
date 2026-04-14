class Admin::SessionsController < ApplicationController
  def new; end

  def create
    password_hash = Rails.application.credentials.admin_password_hash
    if BCrypt::Password.new(password_hash) == params[:password]
      session[:admin] = true
      redirect_to root_path
    else
      flash.now[:error] = 'Mot de passe incorrect'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin] = nil
    redirect_to root_path
  end
end
