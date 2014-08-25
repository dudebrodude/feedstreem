class ChangeColumnName < ActiveRecord::Migration
def change
rename_column :checkins, :users_id, :user_id
rename_column :checkins, :clubs_id, :club_id
end
end
