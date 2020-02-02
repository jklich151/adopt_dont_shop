require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  context "as a visitor" do
    it "can see the shelter with that id including the shelter's info" do
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

      expect(page).to have_content(shelter_1.name)
      expect(page).to have_content(shelter_1.address)
      expect(page).to have_content(shelter_1.city)
      expect(page).to have_content(shelter_1.state)
      expect(page).to have_content(shelter_1.zip)
      expect(page).to_not have_content(shelter_2.name)
      expect(page).to_not have_content(shelter_2.address)
      expect(page).to_not have_content(shelter_2.city)
      expect(page).to_not have_content(shelter_2.state)
      expect(page).to_not have_content(shelter_2.zip)
    end
    it "can click on shelter name and be routed to show page" do
      shelter_1 = Shelter.create(name: "Mike's Shelter",
                                address: "1331 17th Street",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")
      visit '/shelters'

      click_link shelter_1.name
      expect(current_path).to eq("/shelters/#{shelter_1.id}")
    end
    it "can see a link to a shelter's pet page" do
      shelter_1 = Shelter.create(name: "Mike's Shelter",
                                address: "1331 17th Street",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")
      pet_1 = Pet.create(image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo" ,
                        name: "Athena",
                        age: "1",
                        sex: "Female",
                        shelter: shelter_1)

      visit "/shelters/#{shelter_1.id}"
      click_link "Our Pets"
      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    end
  end
end
