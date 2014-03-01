class CreateGoalComments < ActiveRecord::Migration
  def change
    create_table :goal_comments do |t|
      t.integer :goal_id
      t.string :body
      t.integer :poster_id

      t.timestamps
    end
  end
end
