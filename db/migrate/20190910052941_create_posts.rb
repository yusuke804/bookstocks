class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :author_name
      t.string :novel_title
      t.text :introduce_content
      t.text :tweet_content

      t.timestamps
    end
  end
end
