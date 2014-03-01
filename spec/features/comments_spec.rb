require 'spec_helper'

feature "comments" do
  before(:each) do
    visit new_user_url
    fill_in 'username', with: "test"
    fill_in 'password', with: "password"
    click_on "Create User"
  end

  feature "user pages" do
    it "has comment form" do
      expect(page).to have_content("Add Comment")
    end

    it "has comment" do
      fill_in "comment", with: "You can do it!!!!!!!!!!!!!!!!!"
      click_on("Add Comment")
      expect(page).to have_content("You can do it!!!!!!!!!!!!!!!!!")
    end

    it "deletes comments" do
      fill_in "comment", with: "You can do it!!!!!!!!!!!!!!!!!"
      click_on("Add Comment")
      click_on "Delete Comment"
      expect(page).not_to have_content "You can do it!!!!!!!!!!!!!!!!!"
    end
  end

  feature "goal pages" do
    before(:each) do
      click_on "Create a goal"
      fill_in "name", with: "Eat Lunch"
      click_on("Create Goal")
    end

    it "has comment form" do
      expect(page).to have_content("Add Comment")
    end

    it "has comment" do
      fill_in "comment", with: "You can do it!!!!!!!!!!!!!!!!!"
      click_on("Add Comment")
      expect(page).to have_content("You can do it!!!!!!!!!!!!!!!!!")
    end

    it "deletes comments" do
      fill_in "comment", with: "You can do it!!!!!!!!!!!!!!!!!"
      click_on("Add Comment")
      click_on "Delete Comment"
      expect(page).not_to have_content "You can do it!!!!!!!!!!!!!!!!!"
    end
  end
end