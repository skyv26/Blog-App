class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :author, references: :users, null: false, foreign_key: {to_table: :users}
      t.references :post, references: :posts, null: false, foreign_key: {to_table: :posts}

      t.timestamps
    end
  end
end
