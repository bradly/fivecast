class CreateForecasts < ActiveRecord::Migration[8.0]
  def change
    create_table :forecasts do |t|
      t.references :location, null: false, foreign_key: true
      t.integer :current_temp
      t.string :unit

      t.timestamps
    end
  end
end
