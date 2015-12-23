class CreateThanks < ActiveRecord::Migration
  def change
    create_table :thanks do |t|
      t.string :to_whom
      t.string :to_what
      t.references :user
      t.timestamps null: false
    end
  end
end
