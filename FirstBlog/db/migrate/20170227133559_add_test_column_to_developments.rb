class AddTestColumnToDevelopments < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :test_column, :string
  end
end
