class AddOneToAllOrders < SeedMigration::Migration
  def up
    Direction.all.each do |direction|
      direction.update_column(:order, direction.order + 1)
    end
  end

  def down
    Direction.all.each do |direction|
      direction.update_column(:order, direction.order - 1)
    end
  end
end
