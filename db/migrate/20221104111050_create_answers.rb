class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.text :body, null: false
      t.boolean :correct, default: false

      t.timestamps
    end
    add_reference :answers, :test
  end
end
