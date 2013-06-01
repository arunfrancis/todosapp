class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :todo_text, :limit => 160
      t.boolean :complete
      t.boolean :record_del_flag

      t.timestamps
    end
  end
end
