class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.text :title, null: false
      t.integer :level, default: 0

      t.timestamps
    end
    add_reference :tests, :category
  end
end
