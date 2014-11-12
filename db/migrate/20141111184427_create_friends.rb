class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      #t.integer :user_id
      t.references :user
      t.timestamps
    end
  end
end
