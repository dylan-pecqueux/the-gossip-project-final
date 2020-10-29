class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], age: params[:age], city_id: params[:city], description: params[:description], password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.save
        log_in(@user)
        redirect_to "/"
        flash[:notice] = "Bienvenue parmis nous : #{@user.first_name} !"
      else
        render 'new'
      end
    
  end
end
