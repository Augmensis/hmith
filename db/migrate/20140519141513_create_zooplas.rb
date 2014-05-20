class CreateZooplas < ActiveRecord::Migration
  def change
    create_table :zooplas do |t|

      t.timestamps
    end
  end
end
