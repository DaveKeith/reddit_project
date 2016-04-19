class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  max_paginates_per 15
end
