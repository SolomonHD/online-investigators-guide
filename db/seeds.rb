# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([{ net_id: 'tparri2', first_name: 'Terry', last_name: 'Parrish', is_admin: true, provider: 'saml'},
             { net_id: 'sbarre5', first_name: 'Saundra', last_name: 'Barrett', is_admin: true, provider: 'saml'},
             { net_id: 'testuser', first_name: 'Terry', last_name: 'Parrish', is_admin: false, provider: 'saml'}])

QuestionType.create([{ name: 'checkbox', label: 'multiple'},
                     { name: 'radio', label: 'one'}])

SurveyTemplate.create({name: "Default Survey Template", is_default: true})

Admin::SiteInformation.create([{name: "contact_info", text: "admin_site_informations_path", header: "Contact us"},
                              {name: "branding", text: "edit brand"},
                              {name: "about_site", text: "about"}])
