class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.references :unit, null: false, foreign_key: true
      t.string :section_type
      t.string :title
      t.text :instructions
      t.text :context
      t.integer :position

      t.timestamps
    end
  end
end
