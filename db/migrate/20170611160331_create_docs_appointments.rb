class CreateDocsAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id, references: :users, foreign_key: true
      t.integer :patient_id, references: :users, foreign_key: true
      t.text :description
      t.datetime :start
      t.datetime :end
      t.decimal :price, :precision => 8, :scale => 3

      t.timestamps
    end
  end
end
