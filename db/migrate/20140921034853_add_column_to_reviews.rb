class AddColumnToReviews < ActiveRecord::Migration
  def change
     change_table :reviews do |t|
    
      t.references :rating, index: true
    
      
    end
end
end
