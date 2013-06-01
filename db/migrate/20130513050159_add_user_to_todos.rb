class AddUserToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :user, :integer
  end
end
