# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

courses = Course.create([
  {
    title: "REST APIs in Rails",
    description: "Learn how to create RESTFul API-only apps using Ruby on Rails",
    duration: "6 months",
  },
  {
    title: "Build Rails API",
    description: "Learn how to create RESTFul API-only apps using Ruby on Rails",
    duration: "3 months",
  },
  {
    title: "APIs in Rails",
    description: "Learn how to create RESTFul API-only apps using Ruby on Rails",
    duration: "5 months",
  },
  {
    title: "Rails Backend Only",
    description: "Learn how to create RESTFul API-only apps using Ruby on Rails",
    duration: "2 months",
  },  
])

courses.each { |course| course.update_attribute(:slug, course.title.parameterize) }