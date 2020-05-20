class SessionsController < ApplicationController
    
    before_action :require_login, only: :destroy

    def new
        @user = User.new
    end

    def create
        user = User.find_by_credentials(
                params[:user][:username],
                params[:user][:password]
            )
        if user
            login(user)
            redirect_to user_url(user)
        else
            # render json: "You did it wrong yo!"
            flash[:errors] = ["You did it wrong yo!!"]
            # user is nil here so we must write a custom error
            redirect_to new_session_url
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

end
