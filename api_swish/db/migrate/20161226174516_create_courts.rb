class CreateCourts < ActiveRecord::Migration[5.0]
  def change
    create_table :courts do |t|
      t.string :name
      t.string :description
      t.string :status
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
