class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :last_name
      t.string :first_name
      t.references :user
      t.timestamps
    end
  end
end
