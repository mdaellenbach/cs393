class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.string :task
      t.string :date
      t.string :user_id
    end

    create_table :users do |t|
  end
end
