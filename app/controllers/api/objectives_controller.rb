
module Api
  class ObjectivesController < ApplicationController
    before_action :set_objective, only: [:show, :update, :destroy]
    skip_before_action :verify_authenticity_token, only: [:create,:update]

    def index
      # http://localhost:3000/api/objectives
      @objectives = Objective.includes(:supervisor).all
      render json: { status: "Success", message: "Objective successfully Fetched", data: @objectives}, status: :created
    end

    def create
      # http://[::1]:3000/api/objectives
      @objective = Objective.new(objective_params)

      if @objective.save
        render json: { status: "Success", message: "Objective successfully Added"}, status: :created
      else
        render json: { errors: @objective.errors.full_messages }, status: :unprocessable_entity
      end
    end

     # PATCH/PUT /api/objectives/1
     def update
      if @objective.update(objective_params)
        render json: { status: "Success", message: "Objective successfully updated", data: @objective }, status: :ok
      else
        render json: { errors: @objective.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_objective
      @objective = Objective.find(params[:id])
    end

    def objective_params
      params.require(:objective).permit(:name, :planning_year, :total_weight_percent, :supervisor_id, :status, :deadline)
    end
  end
end

