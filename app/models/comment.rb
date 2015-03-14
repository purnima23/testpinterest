class Comments < ActiveRecord::Bases
  # Remember to create a migration!
  belongs_to :user
  belongs_to :post
end
