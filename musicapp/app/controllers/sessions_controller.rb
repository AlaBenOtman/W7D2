class SessionsController < ApplicationController
   
  def new
    @user = User.new
     render :new 
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password]
    if @user 
      login!(@user)
      redirect_to  UsersController#show
    else
      render :new
    end
  end

  def destroy
    logout!
    
    redirec_to 
  end
end
