# app/controllers/api/kpis_controller.rb
module Api
  class KpisController < ApplicationController
    before_action :set_kpi, only: [:show, :update, :destroy]
    skip_before_action :verify_authenticity_token, only: [:create, :update]

    # GET /api/kpis
    def index
      # Check if the objective_id parameter is present in the query string
      if params[:objective_id].present?
        @kpis = Kpi.where(objective_id: params[:objective_id])
      else
        @kpis = Kpi.all
      end

      render json: { status: "Success", message: "KPIs successfully fetched", data: @kpis }, status: :ok
    end

    # GET /api/kpis/1
    def show
      render json: { status: "Success", message: "KPI successfully fetched", data: @kpi }, status: :ok
    end

    # POST /api/kpis
    def create
      @kpi = Kpi.new(kpi_params)

      if @kpi.save
        render json: { status: "Success", message: "KPI successfully added", data: @kpi }, status: :created
      else
        render json: { errors: @kpi.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /api/kpis/1
    def update
      if @kpi.update(kpi_params)
        render json: { status: "Success", message: "KPI successfully updated", data: @kpi }, status: :ok
      else
        render json: { errors: @kpi.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def set_kpi
      @kpi = Kpi.find(params[:id])
    end

    def kpi_params
      params.require(:kpi).permit(:objective_id, :baseline, :annual_target, :weighted_rating, :initiatives, :name, :supervisor_comment, :employee_comment, :status)
    end
    
  end
end
