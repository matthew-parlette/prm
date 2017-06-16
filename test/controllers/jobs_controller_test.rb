require 'test_helper'

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url, as: :json
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { description: @job.description, due_date: @job.due_date, effort: @job.effort, name: @job.name, target_date: @job.target_date, weight: @job.weight, status_id: JobStatus.first.id } }, as: :json
    end

    assert_response 201
    r = JSON.parse(@response.body)
    assert r["status_id"], "Status should not be nil"
  end

  test "should show job" do
    get job_url(@job), as: :json
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { description: @job.description, due_date: @job.due_date, effort: @job.effort, name: @job.name, target_date: @job.target_date, weight: @job.weight, status_id: JobStatus.last.id } }, as: :json
    assert_response 200
    r = JSON.parse(@response.body)
    puts r
    assert r["status_id"], "Status should not be nil"
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job), as: :json
    end

    assert_response 204
  end

  test "should get jobs for a contact" do
    get contact_job_url(contacts(:one), jobs(:one)), as: :json
    assert_response :success
    jobs = JSON.parse(@response.body)
    assert jobs.count > 0
  end
end
