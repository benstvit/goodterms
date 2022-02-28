class CreateLoans < ActiveRecord::Migration[6.1]
  def change
    create_table :loans do |t|
      t.date :loan_date
      t.date :return_date
      t.string :status, default: 'pending'
      t.references :item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
