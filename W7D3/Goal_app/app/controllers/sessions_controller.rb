class SessionsController < ApplicationController
    before_action :require_login, only: :destroy
    def new
        @user = User.new
    end

    def create
        user = User.find(params[:user][:username], params[:user][:password])
        if user
            login_user
            redirect_to user_url(user)
        else
            flash[errors] = ['you did it wrong']
            redirect_to new_session_url
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

end
