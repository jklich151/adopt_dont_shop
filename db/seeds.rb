# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Shelter.destroy_all
shelter_1 = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
shelter_2 = Shelter.create(name: "Meg's Shelter", address: "150 Main Street", city: "Hershey", state: "PA", zip: "17033")
Pet.create(image: "https://www.humanesociety.org/sites/default/files/styles/1240x698/public/2019/02/dog-451643.jpg?h=bf654dbc&itok=MQGvBmuo" , name: "Athena", age: "1", sex: "Female", shelter: shelter_1)
Pet.create(image: "https://www.perfectdogbreeds.com/wp-content/uploads/2019/03/Pitbull-Dog.jpg", name: "Odell", age: "4", sex: "Male", shelter: shelter_2)
