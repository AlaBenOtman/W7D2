class ApplicationController < ActionController::Base
    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in? 
        return true if current_user
         false 
    end

    def log_in_user!(user)
        user.reset_session_token 
    end

end
