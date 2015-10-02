class CreateAccessTokens < ActiveRecord::Migration
  def change
    create_table :access_tokens do |t|
      t.string :access_token
      t.datetime :expires_at
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
