require 'rails_helper'

describe "the users path" do
  it "shows all users" do
    visit users_path
    expect(page).to have_content "Users"
  end
end
