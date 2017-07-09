class AddDeferredToTransactionType < ActiveRecord::Migration[5.0]
  def change
    add_column :transaction_types, :deferred, :integer, default: 0
  end
end
