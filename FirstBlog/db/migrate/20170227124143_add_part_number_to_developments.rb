class AddPartNumberToDevelopments < ActiveRecord::Migration[5.0]
  def change
    add_column :aritcles, :part_number, :string
  end
end
