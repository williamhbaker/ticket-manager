# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

rail_tag = Tag.create!(name: "Rail")
critical_tag = Tag.create!(name: "Critical")
cnr_tag = Tag.create!(name: "Could Not Reproduce")
needs_info_tag = Tag.create!(name: "Needs Info")
out_of_scope_tag = Tag.create!(name: "Out of Scope")

user = User.create!(name: "Bridge Builder", email: "bridge.builder@domain.test", password: "bridges123")
passenger = User.create!(name: "Train Passenger", email: "train.passenger@domain.test", password: "bridges123")

project = Project.create!(name: "Danyang–Kunshan Grand Bridge",
                          description: "The Danyang–Kunshan Grand Bridge is the world's longest bridge.[2] It is a 164.8-kilometre (102.4 mi) long viaduct on the Beijing–Shanghai High-Speed Railway.")

ticket1 = project.tickets.create(name: "Shaky section 6 miles from North end.",
                                 body: "Reported by a rail passenger.",
                                 creator: passenger,
                                 tags: [rail_tag, critical_tag],
                                 status: "new",
                                 assigned_to: user)

ticket1.comments.create!(body: "This seems serious.", user: user)

ticket2 = project.tickets.create(name: "Trains late getting to Wuxi East",
                                 body: "Train was at least 5 minutes late today",
                                 creator: passenger,
                                 tags: [rail_tag, out_of_scope_tag],
                                 status: "fixed")

ticket2.comments.create!(body: "This is not a problem with the bridge", user: user)

ticket3 = project.tickets.create(name: "Track is not connected in the middle",
                                 body: "This is preventing the entire system from working.",
                                 creator: passenger,
                                 tags: [rail_tag, needs_info_tag, cnr_tag],
                                 status: "blocked")

ticket3.comments.create!(body: "I have been unable to observe this myself.", user: user)
