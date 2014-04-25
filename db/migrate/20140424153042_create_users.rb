class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, :password_hash, :bio

  		t.timestamps
  	end
  end
end
