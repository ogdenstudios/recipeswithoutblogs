class AddInitialUsers < SeedMigration::Migration
# Create seed users - initial email addresses are kept in an untracked file to preserve privacy

# This will trigger an error if you're seeding the database without the user seed data

  def up
    begin
      require_relative "users.rb"
      SecretUserSeeds.emails.each do |email| 
          User.create!(
              email: email,
              password: SecretUserSeeds.password
          )
      end
    rescue LoadError
      puts "You don't have the secret user data - request it from tyler@ogdendstudios.xyz"
      puts "Or, create your own dummy file at db/data/users.rb, if you just need to develop"
      exit
    end
  end

  def down
    User.delete_all
  end
end
