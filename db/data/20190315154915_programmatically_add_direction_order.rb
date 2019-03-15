class ProgrammaticallyAddDirectionOrder < SeedMigration::Migration
  def up
    Recipe.all do |recipe|
      Recipe.directions.order(:created_at).each_with_index do |direction, index|
        direction.update_column(:order, index)
      end
    end
  end

  def down
    Direction.all.update_column(:order, nil)
  end
end
