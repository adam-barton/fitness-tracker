class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :muscle_group
      t.integer :goal
      t.integer :reps_completed

      t.timestamps
    end
  end
end
