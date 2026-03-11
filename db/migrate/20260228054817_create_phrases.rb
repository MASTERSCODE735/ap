class CreatePhrases < ActiveRecord::Migration[7.0]
  def change
    create_table :phrases do |t|
      t.references :section, null: false, foreign_key: true
      t.string :speaker
      t.text :text
      t.integer :position

      t.timestamps
    end
  end
end
