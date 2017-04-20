class CreateClinics < ActiveRecord::Migration[5.0]
  def change
    create_table :clinics do |t|
      t.string :name
      t.text :description
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
