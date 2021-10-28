class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.date :day, null: false
      t.time :time, null: false
      t.time :end_time, null: false
      t.string :group_name, null: false
      t.string :manager
      t.string :phone_number
      t.integer :people_number
      t.integer :room_id, null: false
      t.string :use
      t.integer :user_id
      t.datetime :start_time
      t.datetime :finish_time
      t.timestamps
    end
  end
end
