class CreateUserProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trackable, polymorphic: true, null: false
      t.datetime :completed_at
      t.integer :score

      t.timestamps
    end
  end
end
