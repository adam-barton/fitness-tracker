class CreateWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.string :name
      t.interval :duration
      t.timestamp :countdown_starting_time
      t.timestamp :countdown_ending_time

      t.timestamps
    end
  end
end
