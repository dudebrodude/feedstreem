class DropUploadsTable < ActiveRecord::Migration
  def change
  	  def up
    drop_table :uploads
  end

  def down
      create_table :uploads do |t|

      t.timestamps
  end
  end
  end
end
