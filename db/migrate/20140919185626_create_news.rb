class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :title
      t.text :body
      t.string :image_url
      
      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end