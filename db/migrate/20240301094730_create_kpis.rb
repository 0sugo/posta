class CreateKpis < ActiveRecord::Migration[7.0]
  def change
    create_table :kpis do |t|
      t.references :objective, null: false, foreign_key: true
      t.integer :baseline
      t.integer :annual_target
      t.float :weighted_rating
      t.text :initiatives
      t.string :name
      t.text :supervisor_comment
      t.text :employee_comment
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
