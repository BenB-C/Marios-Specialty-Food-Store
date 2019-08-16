require 'rails_helper'

describe "the users path" do
  it "shows all users" do
    visit users_path
    expect(page).to have_content "Users"
  end
end

describe "the user path" do
  it "shows a user's profile" do
    user = FactoryBot.create(:user)
    visit user_path(user.id)
    expect(page).to have_content user.name
    expect(page).to have_content user.email
  end
end
