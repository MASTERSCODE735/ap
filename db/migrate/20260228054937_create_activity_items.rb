class CreateActivityItems < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_items do |t|
      t.references :activity, null: false, foreign_key: true
      t.text :prompt
      t.string :answer
      t.json :options
      t.integer :position

      t.timestamps
    end
  end
end
