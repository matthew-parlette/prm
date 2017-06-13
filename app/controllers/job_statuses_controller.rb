class JobStatusesController < ApplicationController
  before_action :set_job_status, only: [:show, :update, :destroy]

  # GET /job_statuses
  def index
    @job_statuses = JobStatus.all

    render json: @job_statuses
  end

  # GET /job_statuses/1
  def show
    render json: @job_status
  end

  # POST /job_statuses
  def create
    @job_status = JobStatus.new(job_status_params)

    if @job_status.save
      render json: @job_status, status: :created, location: @job_status
    else
      render json: @job_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_statuses/1
  def update
    if @job_status.update(job_status_params)
      render json: @job_status
    else
      render json: @job_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /job_statuses/1
  def destroy
    @job_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_status
      @job_status = JobStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_status_params
      params.require(:job_status).permit(:name)
    end
end
