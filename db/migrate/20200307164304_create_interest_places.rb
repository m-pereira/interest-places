class CreateInterestPlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :interest_places do |t|
      t.string :name, null: false
      t.integer :x, null: false
      t.integer :y, null: false
      t.string :opened, default: 'always'
      t.string :closed, default: 'never'

      t.timestamps
    end
  end
end
