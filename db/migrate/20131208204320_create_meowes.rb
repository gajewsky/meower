class CreateMeowes < ActiveRecord::Migration
  def change
    create_table :meowes do |t|
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end
end
