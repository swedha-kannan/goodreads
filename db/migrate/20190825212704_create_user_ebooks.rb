class CreateUserEbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :user_ebooks do |t|
      t.integer :user_id
      t.integer :ebook_id

      t.timestamps
    end

    add_index :user_ebooks, [:user_id, :ebook_id], unique: true
  end
end
