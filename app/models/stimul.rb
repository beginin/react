class Stimul < ActiveRecord::Base
  has_many :stimulreaction

  def stimul_withid
    self.id.to_s + " - " + self.stimul.to_s
    
  end

  def self.uploadcsv(upload)
    require 'csv'

    content = upload['csv'].read
    detection = CharlockHolmes::EncodingDetector.detect(content)
    utf8_encoded_content = CharlockHolmes::Converter.convert content, detection[:encoding], 'UTF-8'
    #utf8_encoded_content = content
    #logger.debug "Привет #{utf8_encoded_content}"
    csvarray = CSV.parse(utf8_encoded_content, :col_sep => ';')

    #csvarray.delete(csvarray.first)
    csvarray.each do |row|
      n = Stimul.where(:stimul => row[0]).first || Stimul.new(:stimul => row[0])
      n.save
    end
  end
end
