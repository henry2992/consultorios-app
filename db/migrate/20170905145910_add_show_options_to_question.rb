class AddShowOptionsToQuestion < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :show_options, :boolean, default: true
    add_reference :questions, :question, index: true, foreign_key: true
  end
end
