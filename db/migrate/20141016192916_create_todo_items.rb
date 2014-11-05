class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :task
      t.string :date
      t.integer :user_id
    end #do

    create_table :users do |t|
      t.string :name
    end #do
  end #def
end #class
