class CreateHistory < ActiveRecord::Migration[5.0]
  def change
    create_table :histories do |t|
      t.string  :code, index: { unique: true }
      t.integer :patient_id, references: :users, foreign_key: true
      t.integer :doctor_id, references: :users, foreign_key: true
      t.string  :family_history
      t.text    :overview

      t.timestamps
    end
  end
end
