class CreateObjectives < ActiveRecord::Migration[7.0]
  def change
    create_table :objectives do |t|
      t.string :name
      t.date :planning_year
      t.float :total_weight_percent
      t.bigint :supervisor_id
      t.string :status
      t.date :deadline

      t.timestamps
    end

    add_foreign_key :objectives, :employees, column: :supervisor_id, on_delete: :cascade
  end
end
