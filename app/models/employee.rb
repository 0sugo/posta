# class Employee < ApplicationRecord
#   belongs_to :supervisor_name
# end


class Employee < ApplicationRecord
  belongs_to :supervisor, class_name: 'Employee', optional: true
  has_many :subordinates, class_name: 'Employee', foreign_key: 'supervisor_id'

  # Your other model code...
end
