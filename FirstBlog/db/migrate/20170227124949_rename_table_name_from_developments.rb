class RenameTableNameFromDevelopments < ActiveRecord::Migration[5.0]
  def change
    rename_table :aritcles, :article
  end
end
