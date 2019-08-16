require 'rails_helper'

describe "the root path" do
  it "shows a landing page" do
    visit root_path
    # visit landing_page_index_path
    expect(page).to have_content "Mario's Specialty Food Products"
    expect(page).to have_content "New Products"
    expect(page).to have_content "Most Reviewed Product"

  end
end
