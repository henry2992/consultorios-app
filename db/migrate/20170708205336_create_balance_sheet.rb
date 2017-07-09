class CreateBalanceSheet < ActiveRecord::Migration[5.0]
  def change
    create_table :balance_sheets do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :ends_at
      t.belongs_to :clinic, foreign_key: true
      t.timestamps
    end
  end
end
