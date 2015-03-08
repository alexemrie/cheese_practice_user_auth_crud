require 'rails_helper'

feature 'User signup flow' do
  scenario 'allows a user to sign up (sans validations)' do
    visit root_path
    expect(page).to have_content 'Welcome, please click the sign up or sign in links below'

    click_link 'Sign up'
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Sign Up Form'

    fill_in :user_email, with: 'testMcTesterson@example.com'
    fill_in :user_password, with: 'password'
    click_button 'Create User'

    expect(current_path).to eq '/cheeses'
    expect(page).to have_content 'List of Cheeses'
    # hint: flash notice...
    expect(page).to have_content 'Successfully signed up'
  end
end
