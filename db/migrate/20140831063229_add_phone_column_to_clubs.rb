class AddPhoneColumnToClubs < ActiveRecord::Migration
  def change
    add_column :clubs, :phone, :string
  end
end
