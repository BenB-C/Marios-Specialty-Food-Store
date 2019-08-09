class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      #  reviews should have an author, content_body and rating
      t.integer :product_id
      t.string :author
      t.text :content_body
      t.integer :rating
      t.timestamps
    end
  end
end
