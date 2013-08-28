class Worksheet < ActiveRecord::Base
  attr_accessor :sex, :age, :language, :specialty, :city
  validates :sex, :age, :language, :specialty, :city, presence: 	true
  validates :age, numericality: { only_integer: true , :greater_than => 0, :less_than_or_equal_to => 100}
end
