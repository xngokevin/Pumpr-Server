class CreateProfileData < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_data do |t|
      t.integer :user_id
      t.string :description
      t.boolean :display_description
      t.integer :height
      t.boolean :display_height
      t.integer :weight
      t.boolean :display_weight
      t.string :goals
      t.boolean :display_goals
      t.timestamps
    end
  end
end
