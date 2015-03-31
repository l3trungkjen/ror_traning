class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :entry_id
      t.text :title

      t.timestamps null: false
    end
  end
end
