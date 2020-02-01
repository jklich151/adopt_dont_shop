require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  context "as a visitor" do
    it "can see the name of each shelter in the system" do
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

      visit '/shelters'

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_2.name)
    end
  end
end
