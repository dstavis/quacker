class CreateQuacks < ActiveRecord::Migration
  def change
    create_table :quacks do |t|
      t.string     :content
      t.belongs_to :user
      t.timestamps
    end
  end
end
