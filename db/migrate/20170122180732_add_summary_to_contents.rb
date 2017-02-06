class AddSummaryToContents < ActiveRecord::Migration
  def change
  	add_column :contents, :summary, :string
  	add_column :contents, :keywords, :string
  	add_column :contents, :image_url, :string
  	add_column :contents, :image_thumb_url, :string
  end
end
