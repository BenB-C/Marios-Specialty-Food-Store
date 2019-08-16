require 'rails_helper'

describe "the sign_up path" do
  it "allows a user to sign up" do
    visit root_path
    click_link 'Login'
    click_link 'Sign up'
    fill_in 'Name', with: 'Fake Name'
    fill_in 'Email', with: 'fake@fake'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
    visit users_path
    expect(page).to have_content 'Fake Name'
  end
end
