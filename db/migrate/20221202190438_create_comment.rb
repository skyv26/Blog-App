class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.references :author, references: :users, null: false, foreign_key: {to_table: :users}
      t.references :post, references: :posts, null: false, foreign_key: {to_table: :posts}

      t.timestamps
    end
  end
end
