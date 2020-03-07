class CreateInterestPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :interest_places do |t|
      t.string :name
      t.integer :x
      t.integer :y
      t.string :opened
      t.string :closed

      t.timestamps
    end
  end
end
