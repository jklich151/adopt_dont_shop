require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  describe "as a visitor" do
    describe "When I visit the new shelter form by clicking a link on the index" do
      it "I can create a new shelter" do
        visit '/shelters'

        click_link 'New Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in "Name", with: "Jenny's Shelter"
        fill_in "Address", with: "123 Puppy Street"
        fill_in "City", with: "Denver"
        fill_in "State", with: "CO"
        fill_in "Zip", with: "80202"

        click_on 'Create Shelter'

        expect(current_path).to eq('/shelters')
        expect(page).to have_content("Jenny's Shelter")

        new_shelter = Shelter.last

        expect(new_shelter.address).to eq("123 Puppy Street")
        expect(new_shelter.city).to eq("Denver")
        expect(new_shelter.state).to eq("CO")
        expect(new_shelter.zip).to eq("80202")
      end
    end
  end
end
