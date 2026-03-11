class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :section, null: false, foreign_key: true
      t.string :activity_type
      t.string :title
      t.text :instructions
      t.integer :position

      t.timestamps
    end
  end
end
