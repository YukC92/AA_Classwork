
# spec/features/auth_spec.rb

require 'spec_helper'
require 'rails_helper'
# describe inside the describe
feature 'the signup process' do
  scenario 'has a new user page' do
    # background :each
        visit new_user_path
    # end
    expect(page).to have_content('sign up a user')
  end 
    # feature 'signing up a user' do

    scenario 'shows username on the homepage after signup' do
        expect(page).to have_content('ryan')
        user = User.find_by(username: 'ryan')
        expect(current_path).to eq(user_path(user))
    end
end


feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content('ryan')
    user = User.find_by(username: 'ryan')
    expect(current_path).to eq(user_path(user))
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    click_button "logout"
      
  end
  scenario 'doesn\'t show username on the homepage after logout' do
    
    #   expect(current_path).to eq()
        expect(page).not_to have_content('ryan')
        expect(current_path).not_to eq(user_path(user))
  end
end
