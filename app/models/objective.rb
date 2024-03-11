# # app/models/objective.rb
# class Objective < ApplicationRecord
#   belongs_to :supervisor, class_name: 'Employee', optional: true

#   validates :name, presence: true
#   # Add other validations if needed
# end

# app/models/objective.rb
class Objective < ApplicationRecord
  belongs_to :supervisor, class_name: 'Employee', foreign_key: 'supervisor_id'
  has_many :kpis, dependent: :destroy

  validates :name, :planning_year, :total_weight_percent, presence: true
end
