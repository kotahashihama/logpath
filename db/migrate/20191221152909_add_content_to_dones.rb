class AddContentToDones < ActiveRecord::Migration[6.0]
  def change
    add_column :dones, :content, :string
  end
end
