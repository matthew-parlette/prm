class AddOrganizationToContact < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :organization, foreign_key: true
  end
end
