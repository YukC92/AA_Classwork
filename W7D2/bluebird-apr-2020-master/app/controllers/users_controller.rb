class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]
  
  def new
    @user = User.new # so things don't "Crap out" -Julia
    # defaults to render :new
    # just renders the form. seperation of concerns.
  end 

  def edit
    @user = User.find(params[:id]) # User::find raises an error if it fails
    # @user = User.find_by(id: params[:id])
  end 

  def index 
    @users = User.all #ActiveRecord method 
    # render json: users #sends the data from the ActiveRecord collection formatted as json 
    # redirect_to "/users"
    render :index
    # render "/users/index" # alternative way of writing
  end

  def show
    @user = User.find(params[:id]) #pulling id from params
    # render json: user 
    render :show # renders show template for user
    # turns out render :show is the default behavior of this action!
    # each controller action renders a template of the same name by default (/users/show)
  end

  def create
    # user = User.new(username: params[:username], email: params[:email], age: params[:age]) too much work
    # user = User.new(params.require(:user).permit(:username, :email, :age))
    @user = User.new(user_params)

    if @user.save 
      login(@user)
      # render json: @user 
      redirect_to user_url(@user) # to users#show
      # a redirect sends a 300 level response to the client
      # telling it to make a new request to the show action
    else
      flash.now[:errors] = @user.errors.full_messages 
      # we can use the errors messages from our model validations
      # redirect_to new_user_url
      render :new
      # render json: user.errors.full_messages, status: 422 #unprocessable entity 
    end
  end

  def update 
    #find the old user for us to modify
    user = User.find(params[:id]) 
    #find fails loudly if we can't find the user 
    #find_by will return nil if we can't find the user 

    # if user.update(params.require(:user).permit(:username, :email, :age)) #ActiveRecord method
    if user.update(user_params)
      # redirect_to "/users/#{user.id}" #only for get requests 
      # redirect_to user_url(user.id) #check out rails routes for this path 
      redirect_to user_url(user) #rails will pull the id out for us from the object 
      
    else  
      render json: user.errors.full_messages, status: 422 
    end
  end

  def destroy
    redirect_to users_url if current_user.id != params[:id]
    user = User.find(params[:id])
    
    user.destroy
    # render json: user #user destroyed in database, but this user's info exists in this method/http request
    redirect_to users_url
  end

  private 
  #strong params, white-listing of params 
  def user_params 
    params.require(:user).permit(:username, :email, :age, :password)
  end
  
end
