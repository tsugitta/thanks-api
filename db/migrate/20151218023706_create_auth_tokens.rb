class CreateAuthTokens < ActiveRecord::Migration
  def change
    create_table :auth_tokens do |t|
      t.string :token
      t.boolean :active, default: true
      t.date :expires_at
      t.references :user
      t.timestamps null: false
    end
  end
end
