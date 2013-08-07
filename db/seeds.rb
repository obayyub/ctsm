# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Courses extension
Refinery::Courses::Engine.load_seed

# Added by Refinery CMS Projects extension
Refinery::Projects::Engine.load_seed

# Added by Refinery CMS Articles extension
Refinery::Articles::Engine.load_seed

# Added by Refinery CMS People extension
Refinery::People::Engine.load_seed

# Added by Refinery CMS Publications extension
Refinery::Publications::Engine.load_seed

# Added by Refinery CMS Search engine
Refinery::Search::Engine.load_seed

# Added by Refinery CMS Ctsm Homes extension
Refinery::CtsmHomes::Engine.load_seed

# Added by Refinery CMS Visitors extension
Refinery::Visitors::Engine.load_seed

# Added by Refinery CMS Abouts extension
Refinery::Abouts::Engine.load_seed
