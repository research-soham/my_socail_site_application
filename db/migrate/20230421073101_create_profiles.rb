class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :gender
      t.bigint :mobile
      t.string :city
      t.date :date_of_birth
      t.string :user_name, null: false
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
