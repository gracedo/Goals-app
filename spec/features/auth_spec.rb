require 'spec_helper'

feature "the signup process" do
  before(:each) do
    visit new_user_url
  end

  it "has a new user page" do
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: "test"
      fill_in 'password', with: "password"
      click_on "Create User"
    end

    it "shows username on the homepage after signup" do
      expect(page).to have_content "test"
    end

    it "redirects to goals index" do
      expect(page).to have_content "Goals"
    end
  end
end

feature "logging in" do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: "test"
    fill_in 'password', with: "password"
    click_on "Create User"
  end

  it "shows username on the homepage after login" do
    expect(page).to have_content "test"
  end

  it "redirects to goals index if accessing sign in page" do
    visit new_session_url
    expect(page).to have_content "Goals"
  end

  it "redirects to goals index if accessing sign in page" do
    visit new_user_url
    expect(page).to have_content "Goals"
  end

end

feature "logging out" do

  it "begins with logged out state" do
    visit new_user_url
    expect(page).not_to have_content "Hello"
  end

  it "doesn't show username on the homepage after logout" do
    visit new_user_url
    fill_in 'username', with: "test"
    fill_in 'password', with: "password"
    click_on "Create User"
    click_on "Sign Out"

    expect(page).not_to have_content "test"
  end

end
