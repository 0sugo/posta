# app/controllers/api/employees_controller.rb

module Api
  class EmployeesController < ApplicationController
    def index
      # For all employees: http://localhost:3000/api/employees

      @employees = Employee.all
      render json: { status: "Success", message: "Employees successfully fetched", data: @employees }, status: :ok
    end
    
    def show
      # For a specific employee: http://localhost:3000/api/employees/:id
      @employee = Employee.find_by(id: params[:id])

      if @employee
        render json: { status: "Success", message: "Employee details successfully fetched", data: @employee }, status: :ok
      else
        render json: { status: "Error", message: "Employee not found" }, status: :not_found
      end
    end

    def supervisors
      # For all supervisors: http://localhost:3000/api/employees/supervisors

      @supervisors = Employee.where(supervisor_id: nil)
      render json: { status: "Success", message: "Supervisors successfully fetched", data: @supervisors }, status: :ok
    end
  end
end
