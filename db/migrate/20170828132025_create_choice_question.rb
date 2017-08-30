class CreateChoiceQuestion < ActiveRecord::Migration[5.0]
  def change
    create_table :choice_questions do |t|
      t.references :choice, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
