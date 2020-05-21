class UsersController < ApplicationController
    def index
        @user = User.all
        render :index
    end

    def show
        @user = User.find(params[:id])
        render :show
    end

    def create
        @user = User.new(params.require(:user).permit(:username, :password))
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = "invalid password!!"
            render :new
        end
    end
end
