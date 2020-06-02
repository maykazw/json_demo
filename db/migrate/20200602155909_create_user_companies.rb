class CreateUserCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_companies do |t|
t.belongs_to :user
t.string :name
t.string :catch_phrase
t.string :bs
      t.timestamps
    end
  end
end
