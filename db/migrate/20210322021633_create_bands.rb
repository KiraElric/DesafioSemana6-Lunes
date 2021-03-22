class CreateBands < ActiveRecord::Migration[6.1]
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.integer :members, default: 1
      t.date :debut_date
      t.integer :kind, default: 0

      t.timestamps
    end
  end
end
