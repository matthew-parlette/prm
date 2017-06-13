require 'test_helper'

class JobStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_status = job_statuses(:one)
  end

  test "should get index" do
    get job_statuses_url, as: :json
    assert_response :success
  end

  test "should create job_status" do
    assert_difference('JobStatus.count') do
      post job_statuses_url, params: { job_status: { name: @job_status.name } }, as: :json
    end

    assert_response 201
  end

  test "should show job_status" do
    get job_status_url(@job_status), as: :json
    assert_response :success
  end

  test "should update job_status" do
    patch job_status_url(@job_status), params: { job_status: { name: @job_status.name } }, as: :json
    assert_response 200
  end

  test "should destroy job_status" do
    assert_difference('JobStatus.count', -1) do
      delete job_status_url(@job_status), as: :json
    end

    assert_response 204
  end
end
