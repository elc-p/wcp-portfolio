class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string  :prefecture
      t.string  :cities
      t.text    :body
      t.text    :post_image_id

      t.timestamps
    end
  end
end
