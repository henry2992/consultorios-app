class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :text
    add_column :users, :phone, :string
    add_reference :users, :doctor, index: true
  end
end
