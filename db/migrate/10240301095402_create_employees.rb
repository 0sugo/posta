class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :pf_no
      t.string :job_grade_period
      t.string :job_grade
      t.date :employment_date
      t.string :department
      t.string :title
      t.references :supervisor, foreign_key: { to_table: :employees }
      t.string :rank
      t.integer :rating

      t.timestamps
    end
  end
end
