require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  context "as a visitor" do
    it "can see all pets" do
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
      pet_1 = Pet.create(image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo" ,
                        name: "Athena",
                        age: "1",
                        sex: "female",
                        shelter: shelter_1)
      pet_2 = Pet.create(image: "https://www.perfectdogbreeds.com/wp-content/uploads/2019/03/Pitbull-Dog.jpg",
                        name: "Odell",
                        age: "4",
                        sex: "Male",
                        shelter: shelter_2)

      visit "/pets"

      expect(page).to have_css("img[src*='#{pet_1.image}']")
      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.shelter.name)
      expect(page).to have_css("img[src*='#{pet_2.image}']")
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.sex)
      expect(page).to have_content(pet_2.shelter.name)
    end
  end
end
