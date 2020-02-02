require 'rails_helper'

RSpec.describe "shelterpets index page", type: :feature do
  describe "as a visitor" do
    it "can create a new pet" do
      shelter_1 = Shelter.create(name: "Mike's Shelter",
                                address: "1331 17th Street",
                                city: "Denver",
                                state: "CO",
                                zip: "80202")

      visit "/shelters/#{shelter_1.id}/pets"

      click_link "Create Pet"

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

      fill_in "Image", with: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUxeXfvhP9C4afatnhQuwG53BL8x0gE8DhPgJcNOR7Y137W0gcDA&s"
      fill_in "Name", with: "Juneau"
      fill_in "Description", with: "Wild"
      fill_in "Age", with: "4"
      fill_in "Sex", with: "Male"

      click_on "Create Pet"

      new_pet = Pet.last

      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
      expect(new_pet.image).to eq("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUxeXfvhP9C4afatnhQuwG53BL8x0gE8DhPgJcNOR7Y137W0gcDA&s")
      expect(new_pet.name).to eq("Juneau")
      expect(new_pet.description).to eq("Wild")
      expect(new_pet.age).to eq("4")
      expect(new_pet.sex).to eq("Male")
    end
  end
end
