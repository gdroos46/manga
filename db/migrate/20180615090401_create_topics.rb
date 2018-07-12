class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
    	t.string   :topic_title
    	t.integer  :user_id
    	t.integer  :product_id
      t.timestamps
    end
  end
end
