class CreateAttachment < ActiveRecord::Migration[5.0]
  def change
    
    create_table :attachments do |t|
      t.text :description
      t.references :imageable, polymorphic: true, index: true

      t.timestamps
    end

    add_attachment :attachments, :image
  end
end
