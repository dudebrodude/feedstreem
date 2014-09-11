class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :user, index: true
      t.references :club, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
