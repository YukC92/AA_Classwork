require 'rails_helper'
require 'byebug'

RSpec.describe UsersController, type: :controller do


    subject(:user) do
        User.create(username: "ryan", password: "123456")     
    end

    describe "GET #index" do
        it 'render the data for all user' do
            get :index
            expect(response).to render_template(:index)
        end
    end

    describe "GET #show" do
        it 'render one user' do
            get :show, params: {id: user.id}
            expect(response).to render_template(:show)
        end
    end

    describe "POST #create" do
        
        context 'with valid params' do
            it 'logs in the user' do
                post :create, params: {user: {username: "ryan", password: "123456"}}
        
            user = User.find_by(username: 'ryan')
                # verb/request gives us assess to response and session
                expect(session[:session_token]).to eq(user.session_token)
            end

            it 'redirects to the user\'s show page' do
                
                post :create, params: {user: {username: "ryan", password: "123456"}}

                user = User.find_by(username: 'ryan')
                expect(response).to redirect_to(user_url(user))
            end
        end
        
        context 'with invalid params' do
            it 'validates the presence of password and renders the new template with errors' do
                post :create, params: {user: {username: 'Charlos', password: ''}}

                expect(response).to render_template(:new)
            end
        end
    end

end
