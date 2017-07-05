class AddSubjectToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :reporter_name, :string, null: false
    add_column :issues, :subject, :string, null: false
  end
end
