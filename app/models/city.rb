class City < ActiveRecord::Base
  has_many :worksheet
  validates :city, uniqueness: true
end
