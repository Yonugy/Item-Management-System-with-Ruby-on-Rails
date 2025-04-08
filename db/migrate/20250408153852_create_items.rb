class CreateItems < ActiveRecord::Migration[8.0]
  def change
    create_table :items do |t|
      t.string :title
      t.string :category
      t.boolean :is_favorite

      t.timestamps
    end
  end
end
