require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  describe "as a visitor" do
    it "can delete a shelter" do
      shelter_1 = Shelter.create(name: "Mike's Shelter",
                                address: "1331 17th Street",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")
      shelter_2 = Shelter.create(name: "Meg's Shelter",
                                address: "150 Main Street",
                                city: "Hershey",
                                state: "PA",
                                zip: "17033")

      visit "/shelters/#{shelter_1.id}"

      expect(current_path).to eq("/shelters/#{shelter_1.id}")

      click_on "Delete Shelter"

      expect(current_path).to eq("/shelters")

      expect(page).to_not have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
  end
end
