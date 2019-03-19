class AddEasyTestingUser < SeedMigration::Migration
  def up
    User.create!(email: "test@ogdenstudios.xyz", password: "password")
  end

  def down
    User.find_by(email: "test@ogdenstudios.xyz").delete
  end
end
