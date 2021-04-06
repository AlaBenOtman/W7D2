class UsersController < ApplicationController

  def show 
    

  end

  def new
    @user = User.new
     render :new 
  end

  def create
   @user = User.new(user_param)
   if @user.save
    login!(@user)
    redirect_to path
   else 
    render :new
   end
  end


  private 
  def user_param 
    params.require(:user).permit(:email, :password)
  end
end
