class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
