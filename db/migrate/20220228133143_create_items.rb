class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :item_name
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :img_url

      t.timestamps
    end
  end
end
