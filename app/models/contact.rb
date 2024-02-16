class Contact < ApplicationRecord
  belongs_to :user
  belongs_to :super_admin, class_name: 'User'
end
