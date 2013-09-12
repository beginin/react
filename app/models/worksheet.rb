# coding: utf-8
class Worksheet < ActiveRecord::Base
  has_many :stimulreaction, dependent: :destroy
  accepts_nested_attributes_for :stimulreaction, allow_destroy: true
  belongs_to :city
  belongs_to :specialty
  belongs_to :language
  #attr_accessor :sex, :age, :language, :specialty, :city
  validates :number, uniqueness: true
  validates :number, :age, :language, :specialty, :city, presence: 	true
  validates :age, numericality: { only_integer: true , :greater_than => 10, :less_than => 100}


  def sex_name
    man="мужской"
    woman="женский"
    self.sex ? man : woman
  end

  def sex_name=(sex)
    if sex.downcase == "мужской"
      self.sex = true
    elsif sex.downcase == "женский"
      self.sex = false
    else
      self.sex = nil 
    end
  end


  def city_name
    city.try(:city)
  end

  def city_name=(city)
    self.city = City.find_or_create_by(city: city.capitalize) if city.present?
  end

  def specialty_name
    specialty.try(:specialty)
  end


  def specialty_name=(specialty)
    self.specialty = Specialty.find_or_create_by(specialty: specialty.to_s) if specialty.present?
  end

  def language_name
    language.try(:language)
  end

  def language_name=(language)
    self.language = Language.find_or_create_by(language: language.downcase) if language.present?
  end

  def self.uploadxls(upload)
    require 'spreadsheet'

    #content = upload['xls'].read
    #logger.debug "Hello #{content}"
    err = Hash.new
    upload['xls'].each do |xls|
      name = xls.original_filename
      logger.debug "Hello #{name.scan(/\d+/)}"
      directory = "tmp/upload"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(xls.read) }
      book = Spreadsheet.open (path)
      sheet1 = book.worksheet 0
      sheet2 = book.worksheet 1
      #detection = CharlockHolmes::EncodingDetector.detect(content)
      #utf8_encoded_content = CharlockHolmes::Converter.convert content, detection[:encoding], 'UTF-8'
      #utf8_encoded_content = content
      #logger.debug "Привет #{utf8_encoded_content}"
      #csvarray = CSV.parse(utf8_encoded_content, :col_sep => ';')
      work = Worksheet.new(:number =>name.scan(/\d+/).last, :sex_name => sheet1.row(1)[1],:age => sheet1.row(1)[2].to_i, :language_name =>  sheet1.row(1)[3], 
        :specialty_name => sheet1.row(1)[4], :dateinput => sheet1.row(1)[5], :city_name => sheet1.row(1)[6])
      for i in 1..100
        work.stimulreaction.new(:stimul => Stimul.find(sheet2.row(i)[0].to_i),:reaction_name =>sheet2.row(i)[1].to_s)
      end
      if work.save
        err[name] = ["Успешно загружена"]
      else
        err[name] = work.errors.full_messages 
      end
      logger.debug work.errors.full_messages
      File.delete(path)
    end

    #csvarray.delete(csvarray.first)
    #csvarray.each do |row|
    #  n = Stimul.where(:stimul => row[0]).first || Stimul.new(:stimul => row[0])
    #  n.save
    #end
    logger.debug err
    err
  end



end
