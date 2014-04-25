class CreateFlockings < ActiveRecord::Migration
  def change
    create_table :flockings do |t|

      t.belongs_to :user
      t.integer :followee_id

      t.timestamps
    end
  end
end
