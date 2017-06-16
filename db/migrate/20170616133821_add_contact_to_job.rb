class AddContactToJob < ActiveRecord::Migration[5.1]
  def change
    add_reference :jobs, :contact, foreign_key: true
  end
end
