class CreateTransactionType < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_types do |t|
      t.string :title
      t.text :description
      t.integer :accounting_flow, default: 0
      t.timestamps
    end
  end
end
