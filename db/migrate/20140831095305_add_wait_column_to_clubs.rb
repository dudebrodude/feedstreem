class AddWaitColumnToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :wait, :integer
  end
end
