# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create seed users - initial email addresses are kept in an untracked file to preserve privacy

# This will trigger an error if you're seeding the database without the user seed data
begin
    require_relative "data/users.rb"
    SecretUserSeeds.emails.each do |email| 
        User.create!(
            email: email,
            password: ENV["RWB_USER_PASSWORD"]
        )
    end
rescue LoadError
    puts "You don't have the secret user data - request it from tyler@ogdendstudios.xyz"
    puts "Or, create your own dummy file at db/data/users.rb, if you just need to develop"
    exit
end
