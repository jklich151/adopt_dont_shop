require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  describe "as a visitor" do
    before do
      @bob = Shelter.create(name: "Bob's",
                            address: "567 Cat Ave",
                            city: "Denver",
                            state: "CO",
                            zip: "80202")
    end

    it "I can update a shelter" do

      visit "/shelters/#{@bob.id}"

      click_link "Update Shelter"

      expect(current_path).to eq("/shelters/#{@bob.id}/edit")

      fill_in "Name", with: "Bob's Shelter"
      fill_in "Address", with: "567 Cat Ave"
      fill_in "City", with: "Denver"
      fill_in "State", with: "CO"
      fill_in "Zip", with: "80202"

      click_on "Update Shelter"

      expect(current_path).to eq("/shelters")
      expect(page).to have_content("Bob's Shelter")
    end
  end
end
