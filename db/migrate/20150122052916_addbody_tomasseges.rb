class AddbodyTomasseges < ActiveRecord::Migration
  def change
  	add_column :masseges,:body,:text
  end
end
