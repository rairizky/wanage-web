class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :avatar
      t.date :dob
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
