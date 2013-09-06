# coding: utf-8
class Worksheet < ActiveRecord::Base
  has_many :stimulreaction
  accepts_nested_attributes_for :stimulreaction, allow_destroy: true
  belongs_to :city
  belongs_to :specialty
  belongs_to :language
  #attr_accessor :sex, :age, :language, :specialty, :city
  #validates :sex, :age, :language, :specialty, :city, presence: 	true
  #validates :age, numericality: { only_integer: true , :greater_than => 0, :less_than_or_equal_to => 100}


  def sex_name
    man="мужской"
    woman="женский"
    self.sex ? man : woman
  end

  def sex_name=(sex)
    if sex == "мужской"
      self.sex = true
    elsif sex == "женский"
      self.sex = false
    else
      self.sex = nil 
    end
  end


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

  def self.uploadxls(upload)
    require 'spreadsheet'

    #content = upload['xls'].read
    #logger.debug "Hello #{content}"
    name = upload['xls'].original_filename
    logger.debug "Hello #{name.scan(/\d+/)}"
    directory = "tmp/upload"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(upload['xls'].read) }
    book = Spreadsheet.open (path)
    sheet1 = book.worksheet 0
    sheet2 = book.worksheet 1
    #detection = CharlockHolmes::EncodingDetector.detect(content)
    #utf8_encoded_content = CharlockHolmes::Converter.convert content, detection[:encoding], 'UTF-8'
    #utf8_encoded_content = content
    #logger.debug "Привет #{utf8_encoded_content}"
    #csvarray = CSV.parse(utf8_encoded_content, :col_sep => ';')
    work = Worksheet.create(:number =>name.scan(/\d+/).last, :sex_name => sheet1.row(1)[1],:age => sheet1.row(1)[2], :language_name =>  sheet1.row(1)[3], 
      :specialty_name => sheet1.row(1)[4], :dateinput => sheet1.row(1)[5], :city_name => sheet1.row(1)[6])
    for i in 1..101
      work.stimulreaction.create(:stimul => Stimul.find(sheet2.row(i)[0].to_i),:reaction_name =>sheet2.row(i)[1])
    end
    File.delete(path)

    #csvarray.delete(csvarray.first)
    #csvarray.each do |row|
    #  n = Stimul.where(:stimul => row[0]).first || Stimul.new(:stimul => row[0])
    #  n.save
    #end
  end



end
