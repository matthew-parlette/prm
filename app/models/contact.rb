class Contact < ApplicationRecord
  belongs_to :organization, optional: true
end
