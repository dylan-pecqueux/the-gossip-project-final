class CitiesController < ApplicationController
  before_action :authenticate_user, only: [:show]

  def show
    @city = City.find(params[:id])
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Connecte-toi"
      redirect_to new_session_path
    end
  end
end
