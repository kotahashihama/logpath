class AddUserIdToDones < ActiveRecord::Migration[6.0]
  def change
    add_column :dones, :user_id, :integer
  end
end
