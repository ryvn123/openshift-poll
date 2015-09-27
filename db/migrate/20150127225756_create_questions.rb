class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.string :kind
      t.references :poll, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :polls, on_delete: :cascade
  end
end
