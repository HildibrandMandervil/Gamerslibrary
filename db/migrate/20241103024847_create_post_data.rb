class CreatePostData < ActiveRecord::Migration[6.1]
  def change
    create_table :post_data do |t|
      t.string:title
      t.string:body
      t.string:janle
      t.timestamps
    end
  end
end
