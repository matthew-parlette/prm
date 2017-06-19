require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "create contact without organization" do
    assert Contact.create(name: "test")
  end

  test "create contact with organization" do
    assert Contact.create(name: "test", organization: Organization.first)
    assert Contact.last.organization
  end
end
