class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.integer :attendance, default: 0
      t.integer :duration, default: 0
      t.date :date
      t.belongs_to :band, null: false, foreign_key: true

      t.timestamps
    end
  end
end
