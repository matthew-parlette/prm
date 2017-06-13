class Job < ApplicationRecord
  has_one :status, class_name: "JobStatus"
end
