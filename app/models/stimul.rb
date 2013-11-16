class Stimul < ActiveRecord::Base
  has_many :stimulreaction
  @@agemin = 10
  @@agemax = 90
  @@specialty_id=nil
  @@sex=nil
  @@normalization=nil
  @@sort=nil

  def agemin
    @@agemin
  end

  def agemin=(some_hash)
    @@agemin = some_hash
  end

  def agemax
    @@agemax
  end

  def agemax=(some_hash)
    @@agemax = some_hash
  end

  def specialty_id
    @@agemin
  end

  def specialty_id=(some_hash)
    @@specialty_id = some_hash
  end

  def sex
    @@sex
  end

  def sex=(some_hash)
    @@sex = some_hash
  end

  def normalization
    @@normalization
  end

  def normalization=(some_hash)
    @@normalization = some_hash
  end

  def sort
    @@sort
  end

  def sort=(some_hash)
    @@sort = some_hash
  end

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

  def reaction_all_count
    d = self.stimulreaction.joins(:worksheet,:reaction).where("age >= ? AND age <= ?", @@agemin, @@agemax)
    if @@specialty_id.nil? == false
      d = d.where("specialty_id = ?", @@specialty_id)
    end
    if @@sex == "man"
      d = d.where("sex = true", @@sex)
    end
    if @@sex == "woman"
      d = d.where("sex = false", @@sex)
    end  
    if @@sort == "freq"
      d = d.order("count_all DESC")
    else 
      d = d.order("reaction ASC")
    end
    d.count

  end

  def reaction_all
    d = self.stimulreaction.joins(:worksheet,:reaction).where("age >= ? AND age <= ?", @@agemin, @@agemax)
    if @@specialty_id.nil? == false
      d = d.where("specialty_id = ?", @@specialty_id)
    end
    if @@sex == "man"
      d = d.where("sex = true", @@sex)
    end
    if @@sex == "woman"
      d = d.where("sex = false", @@sex)
    end
    
    d=d.select("reaction_id, reaction, count(*) as count_all").group("reaction_id,reaction")
    
    if @@sort == "freq"
      d = d.order("count_all DESC")
    else 
      d = d.order("reaction ASC")
    end
    d
  end

  def reaction_count(reaction_id)
    d = self.stimulreaction.where("reaction_id = ?", reaction_id).joins(:worksheet).where("age >= ? AND age <= ?", @@agemin, @@agemax)
    if @@specialty_id.nil? == false
      d = d.where("specialty_id = ?", @@specialty_id)
    end
    if @@sex == "man"
      d = d.where("sex = true", @@sex)
    end
    if @@sex == "woman"
      d = d.where("sex = false", @@sex)
    end
    d = d.count
    if normalization.nil? == false
      d=(100*d/self.reaction_all_count).round(2) rescue nil
    end
    d    
  end

end
