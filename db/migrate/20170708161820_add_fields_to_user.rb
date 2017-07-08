class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :national_id, :string
    add_column :users, :pob, :string
    add_column :users, :dob, :date
    add_column :users, :cellphone, :string
    add_column :users, :office_phone, :string
    add_column :users, :gender, :integer, default: 0
  end
end
