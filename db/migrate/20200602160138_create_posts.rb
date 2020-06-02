class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.integer :external_uuid
      t.text :body
      t.belongs_to :user
      t.timestamps
    end
    add_index :posts,:external_uuid
  end
end
