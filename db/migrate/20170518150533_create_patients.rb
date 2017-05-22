class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.text :address
      t.string :phone
      t.integer :user_id, :references => "user", foreign_key: true
      t.integer :doctor_id, :references => "user", foreign_key: true 
      t.timestamps
    end
  end
end
