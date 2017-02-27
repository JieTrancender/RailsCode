class RemovePartNumberFromDevelopments < ActiveRecord::Migration[5.0]
  def change
    remove_column :aritcles, :part_number, :string
  end
end
