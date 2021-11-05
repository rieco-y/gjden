class CreateLooks < ActiveRecord::Migration[6.0]
  def change
    create_table :looks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :reservation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
