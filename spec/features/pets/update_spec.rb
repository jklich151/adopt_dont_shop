require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  describe "as a visitor" do
      before do
        @shelter_1 = Shelter.create(name: "Mike's Shelter",
                                  address: "1331 17th Street",
                                  city: "Denver",
                                  state: "CO",
                                  zip: "80202")
        @pet_1 = Pet.create(image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo" ,
                          name: "Athena",
                          description: "Lazy",
                          age: "1",
                          sex: "Female",
                          adoption_status: "Available",
                          shelter: @shelter_1)
      end

      it "can update a pet" do

      visit "/pets/#{@pet_1.id}"

      click_link "Update Pet"

      expect(current_path).to eq("/pets/#{@pet_1.id}/edit")

      fill_in "Image", with: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo"
      fill_in "Name", with: "Athena"
      fill_in "Description", with: "Lazy"
      fill_in "Age", with: "1"
      fill_in "Sex", with: "Female"
      fill_in :adoption_status, with: "Available"

      click_on "Update Pet"

      expect(current_path).to eq("/pets/#{@pet_1.id}")
      expect(page).to have_css("img[src*='#{@pet_1.image}']")
      expect(page).to have_content("Athena")
      expect(page).to have_content("Lazy")
      expect(page).to have_content("1")
      expect(page).to have_content("Female")
      expect(page).to have_content("Available")
    end
  end
end
