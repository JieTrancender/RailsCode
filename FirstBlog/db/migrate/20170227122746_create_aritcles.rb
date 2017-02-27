class CreateAritcles < ActiveRecord::Migration[5.0]
  def change
    create_table :aritcles do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
