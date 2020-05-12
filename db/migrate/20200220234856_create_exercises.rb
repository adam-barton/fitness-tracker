class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle_group
      t.text :description
      t.integer :reps_goal, default: 0
      t.integer :reps_completed, default: 0
      t.integer :workout_id

      t.timestamps
    end
  end
end
