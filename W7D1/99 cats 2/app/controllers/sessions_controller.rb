class SessionsController < ApplicationController
    before_action :require_no_user 
    skip_before_action :require_no_user, only: [:destroy] 
    
    def new 
        @user = User.new 
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user
            login_user(user)
            redirect_to cats_url
        else
            render json: "not credentials."
        end
    end

    def destroy
        user = current_user
        if user
            user.reset_session_token!
        end
        session[:session_token] = nil 
        
        redirect_to cats_url
    end
end
