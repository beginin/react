class Worksheet < ActiveRecord::Base
  has_many :stimulreaction
  belongs_to :city
  belongs_to :specialty
  belongs_to :language
  #attr_accessor :sex, :age, :language, :specialty, :city
  #validates :sex, :age, :language, :specialty, :city, presence: 	true
  #validates :age, numericality: { only_integer: true , :greater_than => 0, :less_than_or_equal_to => 100}

  def city_name
    city.try(:city)
  end

  def city_name=(city)
    self.city = City.find_or_create_by(city: city) if city.present?
  end

  def specialty_name
    specialty.try(:specialty)
  end

  def specialty_name=(specialty)
    self.specialty = Specialty.find_or_create_by(specialty: specialty) if specialty.present?
  end

  def language_name
    language.try(:language)
  end

  def language_name=(language)
    self.language = Language.find_or_create_by(language: language) if language.present?
  end



end
