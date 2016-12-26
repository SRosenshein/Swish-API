class DropCourtsTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :courts
  end
  
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
