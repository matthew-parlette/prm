class JobsController < ApplicationController
  before_action :set_contact, only: [:index, :show]
  before_action :set_job, only: [:show, :update, :destroy]

  # GET /jobs
  def index
    @jobs = Job.where(contact: @contact) if @contact
    @jobs = Job.all if @contact.nil?

    render json: @jobs
  end

  # GET /jobs/1
  def show
    render json: @job
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    if @job.save
      render json: @job, status: :created, location: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /jobs/1
  def update
    if @job.update(job_params)
      render json: @job
    else
      render json: @job.errors, status: :unprocessable_entity
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
  end

  private
    def set_contact
      if params[:contact_id] then
        @contact = Contact.find(params[:contact_id])
      else
        @contact = nil
      end
    end

    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def job_params
      params.require(:job).permit(:name, :description, :weight, :target_date, :due_date, :effort, :status_id)
    end
end
