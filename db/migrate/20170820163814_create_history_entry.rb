class CreateHistoryEntry < ActiveRecord::Migration[5.0]
  def change
    create_table :history_entries do |t|
      t.text    :reason_for_the_visit
      t.boolean :pain
      t.string  :control
      t.boolean :gingivitis
      t.string  :prosthetic_restoration
      t.string  :other
      t.string  :current_disease
      t.string  :appearance
      t.string  :face
      t.string  :lips_and_commissure
      t.string  :nodes
      t.string  :temporomandibular_joint
      t.string  :ears
      t.string  :hyoidea_thyroidea_region
      t.string  :cheeks
      t.string  :mucosa
      t.string  :gum
      t.string  :tongue
      t.string  :palate
      t.string  :rx_panoramic
      t.string  :rx_coronal
      t.string  :rx_periapical
      t.string  :lab
      t.string  :the_model
      t.string  :blood_pressure
      t.text    :observations

      t.timestamps
    end
  end
end
