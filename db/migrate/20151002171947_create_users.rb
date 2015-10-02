class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :image
      t.string :name
      t.string :email
      t.string :oauth_uid

      t.timestamps
    end
  end
end
