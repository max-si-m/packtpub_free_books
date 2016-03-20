class Book < ActiveRecord::Base
  validates :title, :url, presence: true, uniqueness: true
end
