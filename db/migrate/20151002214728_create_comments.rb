class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :idea, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
