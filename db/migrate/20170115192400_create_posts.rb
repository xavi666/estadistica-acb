class CreatePosts < ActiveRecord::Migration
  def change
    create_table :contents do |t|
		t.string   "title"
		t.text     "body"
		t.integer   "user_id"
		t.boolean  "published",      default: false
		t.timestamps
    end
    add_index "contents", ["user_id"]
    add_index "contents", ["published"]
  end
end
