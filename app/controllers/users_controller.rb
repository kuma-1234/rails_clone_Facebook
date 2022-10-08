class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to 
    else
      render :new
    end
  end


  private

  def params_user
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
