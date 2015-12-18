class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :thanks_id
      t.string :name
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end

    add_index :users, :thanks_id, unique: true
  end
end
