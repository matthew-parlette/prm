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
      post jobs_url, params: { job: { description: @job.description, due_date: @job.due_date, effort: @job.effort, name: @job.name, target_date: @job.target_date, weight: @job.weight, status_id: 2 } }, as: :json
    end

    assert_response 201
    r = JSON.parse(@response.body)
    assert r["status_id"] == 2
  end

  test "should show job" do
    get job_url(@job), as: :json
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { description: @job.description, due_date: @job.due_date, effort: @job.effort, name: @job.name, target_date: @job.target_date, weight: @job.weight, status_id: 3 } }, as: :json
    assert_response 200
    r = JSON.parse(@response.body)
    assert r["status_id"] == 3
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job), as: :json
    end

    assert_response 204
  end
end
