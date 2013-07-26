# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Textbooks extension
Refinery::Textbooks::Engine.load_seed

# Added by Refinery CMS Journals extension
Refinery::Journals::Engine.load_seed

# Added by Refinery CMS Conferences extension
Refinery::Conferences::Engine.load_seed

# Added by Refinery CMS Reports extension
Refinery::Reports::Engine.load_seed

# Added by Refinery CMS Courses extension
Refinery::Courses::Engine.load_seed

# Added by Refinery CMS Projects extension
Refinery::Projects::Engine.load_seed

# Added by Refinery CMS Articles extension
Refinery::Articles::Engine.load_seed

# Added by Refinery CMS People extension
Refinery::People::Engine.load_seed
