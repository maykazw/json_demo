class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.belongs_to :post
      t.string :name
      t.string :email
      t.text :body
      t.integer :external_uuid
      t.timestamps
    end
    add_index :comments,:external_uuid

  end
end
