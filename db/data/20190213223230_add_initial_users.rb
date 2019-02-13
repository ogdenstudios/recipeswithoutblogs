class AddInitialUsers < SeedMigration::Migration
# Create seed users - initial email addresses are kept in an untracked file to preserve privacy
# This will trigger an error if you're seeding the database without the user seed data
  def up
    require_relative "users.rb"
    SecretUserSeeds.emails.each do |email| 
      User.create!( email: email, password: SecretUserSeeds.password)
    end
  end

  def down
    User.delete_all
  end
end
