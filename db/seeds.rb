# db/seeds.rb
# Create Employees
supervisor = Employee.create(pf_no: 'S001', job_grade_period: 'Grade 1', job_grade: 'Manager', employment_date: Date.today, department: 'HR', title: 'HR Manager', rank: 'Manager', rating: 4, name: 'Joseck Osugo')

employee_1 = Employee.create(pf_no: 'E001', job_grade_period: '5', job_grade: 'J', employment_date: Date.today, department: 'HR', title: 'HR Executive', supervisor: supervisor, rank: 'Executive', rating: 3, name: 'Victor Mwangima')
employee_2 = Employee.create(pf_no: 'E002', job_grade_period: '2', job_grade: 'K', employment_date: Date.today, department: 'IT', title: 'IT Executive', supervisor: supervisor, rank: 'Executive', rating: 4, name: 'John Doe')
# Add more employees as needed

# Create Objectives
objective_1 = Objective.create(name: 'Objective 1', planning_year: Date.today, total_weight_percent: 10.0, supervisor_id: employee_1.id, status: 'In Progress', deadline: Date.today + 30.days)
objective_2 = Objective.create(name: 'Objective 2', planning_year: Date.today, total_weight_percent: 20.0, supervisor_id: employee_2.id, status: 'Not Started', deadline: Date.today + 60.days)

# Create KPIs
kpi_1 = Kpi.create(objective: objective_1, baseline: 50, annual_target: 100, weighted_rating: 75.0, initiatives: 'Initiative 1', name: 'KPI 1', supervisor_comment: 'Good job!', employee_comment: 'Thank you!', status: true)
kpi_2 = Kpi.create(objective: objective_1, baseline: 30, annual_target: 80, weighted_rating: 65.0, initiatives: 'Initiative 2', name: 'KPI 2', supervisor_comment: 'Keep it up!', employee_comment: 'I will!')
# Add more KPIs as needed
