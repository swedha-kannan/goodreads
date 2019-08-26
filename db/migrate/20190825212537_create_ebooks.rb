class CreateEbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :ebooks do |t|
      t.string :title
      t.string :author
      t.string :description

      t.timestamps
    end
  end
end
