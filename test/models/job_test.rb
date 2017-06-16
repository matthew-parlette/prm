require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test "create job without contact" do
    assert Job.create(name: "test")
  end

  test "create job with contact" do
    assert Job.create(name: "test", contact: Contact.first)
    assert Job.last.contact
  end
end
