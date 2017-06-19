require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url, as: :json
    assert_response :success
  end

  test "should create contact" do
    assert_difference('Contact.count') do
      post contacts_url, params: { contact: { name: @contact.name, weight: @contact.weight } }, as: :json
    end

    assert_response 201
  end

  test "should show contact" do
    get contact_url(@contact), as: :json
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { name: @contact.name, weight: @contact.weight } }, as: :json
    assert_response 200
  end

  test "should destroy contact" do
    assert_difference('Contact.count', -1) do
      delete contact_url(@contact), as: :json
    end

    assert_response 204
  end

  test "should get contacts for an organization" do
    get organization_contacts_url(organizations(:one)), as: :json
    assert_response :success
    contacts = JSON.parse(@response.body)
    assert contacts.count > 0, "Organization one returned no contacts"
    assert contacts.count == 1, "Organization one returned multiple contacts, but should only return one"
  end
end
