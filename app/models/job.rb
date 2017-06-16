class Job < ApplicationRecord
  belongs_to :status, class_name: "JobStatus"
  belongs_to :contact, optional: true
end
