require 'rails_helper'

RSpec.describe "welcome controller" do
  it "can access pet link from Welcome Page" do
    visit "/"
    click_link "All Pets"
    expect(current_path).to eq("/pets")
  end

  it "can access shelters link from Welcome Page" do
    visit "/"
    click_link "All Shelters"
    expect(current_path).to eq("/shelters")
  end
end
