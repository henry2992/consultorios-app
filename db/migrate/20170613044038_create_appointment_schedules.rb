class CreateAppointmentSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :appointment_schedules do |t|
      t.belongs_to :appointment, foreign_key: true
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
    remove_column :appointments, :start, :datetime
    remove_column :appointments, :end, :datetime
  end
end
