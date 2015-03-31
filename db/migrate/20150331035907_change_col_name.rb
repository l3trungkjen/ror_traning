class ChangeColName < ActiveRecord::Migration
  def change
    rename_column :comments, :user_id, :user_comment_id
  end
end
