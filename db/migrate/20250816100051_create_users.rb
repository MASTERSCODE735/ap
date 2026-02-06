class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :mobile
      t.string :name
      t.string :role
      t.integer :org_id
      t.string :avatar_url

      t.timestamps
    end
  end
end
