class CreateUserAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_addresses do |t|
t.belongs_to :user
t.string :street
t.string :suite
t.string :city
t.string :zipcode
t.float :geo_lat
t.float :geo_lng
      t.timestamps
    end
  end
end
