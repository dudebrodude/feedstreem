class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :name
      t.references :users, index: true
      t.references :clubs, index: true

      t.timestamps
    end
  end
end
