class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to "/"
    else
      flash.now[:danger] = "Combinaison mot de passe/email invalide"
      render 'new'
    end

  end

  def destroy
    session.delete(:user_id)
    redirect_to "/"
  end
end
