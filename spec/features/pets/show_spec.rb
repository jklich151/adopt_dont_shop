require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  context "as a visitor" do
    it "can see a pet by id" do
      shelter_1 = Shelter.create(name: "Mike's Shelter",
                            address: "1331 17th Street",
                            city: "Denver",
                            state: "CO",
                            zip: "80202")
      pet_1 = Pet.create(image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo" ,
                        name: "Athena",
                        description: "lazy",
                        age: "1",
                        sex: "Female",
                        adoption_status: "available",
                        shelter: shelter_1)
      pet_2 = Pet.create(image: "https://www.perfectdogbreeds.com/wp-content/uploads/2019/03/Pitbull-Dog.jpg",
                        name: "Odell",
                        description: "sassy",
                        age: "4",
                        sex: "Male",
                        adoption_status: "available",
                        shelter: shelter_1)

      visit "/pets/#{pet_1.id}"

      expect(page).to have_css("img[src*='#{pet_1.image}']")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.description)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.adoption_status)
      expect(page).to_not have_css("img[src*='#{pet_2.image}']")
      expect(page).to_not have_content(pet_2.name)
    end
    it "can click on pet name and be routed to show page" do
      shelter_1 = Shelter.create(name: "Mike's Shelter",
                            address: "1331 17th Street",
                            city: "Denver",
                            state: "CO",
                            zip: "80202")
      pet_1 = Pet.create(image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo" ,
                        name: "Athena",
                        description: "lazy",
                        age: "1",
                        sex: "Female",
                        adoption_status: "available",
                        shelter: shelter_1)
      visit '/pets'

      click_link pet_1.name
      expect(current_path).to eq("/pets/#{pet_1.id}")
    end
  end
end
