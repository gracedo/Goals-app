class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name, null: false
      t.boolean :public, null: false, default: true
      t.integer :user_id, null: false
      t.boolean :completed, null: false, default: false

      t.timestamps
    end

    add_index :goals, [:name, :user_id], unique: true
  end
end
