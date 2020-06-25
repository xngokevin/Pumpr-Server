class SetDefaultForProfileData < ActiveRecord::Migration[6.0]
  def change
    change_column_default :profile_data, :display_description, true
    change_column_default :profile_data, :display_height, false
    change_column_default :profile_data, :display_weight, false
    change_column_default :profile_data, :display_goals, true
  end
end
