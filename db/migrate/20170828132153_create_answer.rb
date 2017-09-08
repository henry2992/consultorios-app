class CreateAnswer < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :choice, foreign_key: true
      t.references :choice_question, foreign_key: true
      t.references :history, foreign_key: true
      
      t.timestamps
    end
  end
end
