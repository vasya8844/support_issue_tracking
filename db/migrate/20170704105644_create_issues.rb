class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :uu_id
      t.text :description
      t.string :reporter_email

      t.timestamps null: false
    end

    create_index :issues, :uu_id, unique: true
  end
end
