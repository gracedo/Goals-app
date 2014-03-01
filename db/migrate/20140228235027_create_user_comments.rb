class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :user_id
      t.string :body
      t.integer :poster_id

      t.timestamps
    end
  end
end
