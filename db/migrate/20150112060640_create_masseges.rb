class CreateMasseges < ActiveRecord::Migration
  def change
    create_table :masseges do |t|
    	t.integer  :user_id
    	t.integer  :friend_id
    	t.string   :status
      t.timestamps null: false
    end
  end
end