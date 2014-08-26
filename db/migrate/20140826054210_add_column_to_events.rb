class AddColumnToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :club, index: true
  end
end
