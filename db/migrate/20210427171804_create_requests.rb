class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.text :message
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
