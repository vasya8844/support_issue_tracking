class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :user_id
      t.integer :issue_id

      t.timestamps null: false
    end
    add_index :comments, :issue_id
  end
end
