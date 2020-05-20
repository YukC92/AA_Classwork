class ApplicationController < ActionController::Base

    helper_method :current_user #allows using the #current_user method in views
    
    def current_user
        user = User.find_by(session_token: session[:session_token])
    end

    def login_user(user)
        session[:session_token] = user.reset_session_token!
    end

    def require_no_user
        redirect_to cats_url if current_user
    end
end
