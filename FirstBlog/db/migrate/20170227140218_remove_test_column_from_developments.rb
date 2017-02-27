class RemoveTestColumnFromDevelopments < ActiveRecord::Migration[5.0]
  def change
    remove_column :articles, :test_column
  end
end
