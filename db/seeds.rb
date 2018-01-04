# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin::SiteInformation.create([{name: "maintenance_mode", isOn: 0, text: "maintenance", header: "maintenance"},
                              {name: "feedback_survey", text: "https://www.surveymonkey.com/r/7FG6PP5", isOn: 1}])
