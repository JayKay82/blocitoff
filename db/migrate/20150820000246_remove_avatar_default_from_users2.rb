class RemoveAvatarDefaultFromUsers2 < ActiveRecord::Migration
  def change
    change_column_default :users, :avatar, nil
  end
end
