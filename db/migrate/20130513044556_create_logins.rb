class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :name, :limit=>100
      t.string :email, :limit=>100
      t.string :password, :limit=>10
      t.boolean :record_del_flag

      t.timestamps
    end
  end
end
