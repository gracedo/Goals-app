require 'spec_helper'

feature 'goals index page' do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: "test"
    fill_in 'password', with: "password"
    click_on "Create User"
  end

  it "should have 'new goal' link" do
    expect(page).to have_content "Create a goal"
  end

  it "can mark goals completed" do
    click_on "Create a goal"
    fill_in "name", with: "Eat Lunch"
    click_on("Create Goal")
    click_on "\u2713"

    page.find('#completed_goals').should have_text("Eat Lunch")
  end
end

feature 'public goals index page' do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: "test"
    fill_in 'password', with: "password"
    click_on "Create User"
    click_on "Create a goal"
    fill_in "name", with: "Eat Lunch"
    click_on("Create Goal")
    click_on "Create a goal"
    fill_in "name", with: "Eat Dinner"
    choose "Private"
    click_on("Create Goal")
    click_on "Sign Out"
    visit goals_url
  end

  it "should only show public goals from other users" do
    expect(page).to have_content "Eat Lunch"
  end

  it "should not show private goals from other users" do
    expect(page).not_to have_content "Eat Dinner"
  end
end

feature 'goal creation process' do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: "test"
    fill_in 'password', with: "password"
    click_on "Create User"
    click_on "Create a goal"
  end

  it "has a new goals page" do
    expect(page).to have_content("New Goal")
  end

  feature 'creating a goal' do
    before(:each) do
      fill_in "Name", with: "Eat Lunch"
      click_on("Create Goal")
    end

    it "redirects to goal's index page" do
      expect(page).to have_content("Eat Lunch")
    end

    it "should be public by default" do
      expect(page).to have_content("public")
    end
  end
end

feature 'goal editing' do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: "test"
    fill_in 'password', with: "password"
    click_on "Create User"
    click_on "Create a goal"
    fill_in "name", with: "Eat Lunch"
    click_on("Create Goal")
    click_on "Edit Goal"
  end

  it "has an edit page" do
    expect(page).to have_content "Edit This Goal"
  end

  it "updates goal name" do
    fill_in "Name", with: "Skip Lunch"
    click_on "Update Goal"
    expect(page).to have_content("Skip Lunch")
  end

  it "updates goal to completed" do
    check("Completed")
    click_on "Update Goal"
    page.find('#completed_goals').should have_text("Eat Lunch")
  end
end