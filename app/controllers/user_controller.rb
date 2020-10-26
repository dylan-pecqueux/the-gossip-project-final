class UserController < ApplicationController
  def user_profile
    @user = User.find(params[:user_profile])
  end
end
