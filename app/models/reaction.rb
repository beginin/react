class Reaction < ActiveRecord::Base
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

  def stimul_all_count
    d = self.stimulreaction.joins(:worksheet,:stimul).where("age >= ? AND age <= ?", @@agemin, @@agemax)
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
      d = d.order("stimul ASC")
    end
    d.count
    
  end

  def stimul_all
    d = self.stimulreaction.joins(:worksheet,:stimul).where("age >= ? AND age <= ?", @@agemin, @@agemax)
    if @@specialty_id.nil? == false
      d = d.where("specialty_id = ?", @@specialty_id)
    end
    if @@sex == "man"
      d = d.where("sex = true", @@sex)
    end
    if @@sex == "woman"
      d = d.where("sex = false", @@sex)
    end
    
    d=d.select("stimul_id, stimul, count(*) as count_all").group("stimul_id,stimul")
    
    if @@sort == "freq"
      d = d.order("count_all DESC")
    else 
      d = d.order("stimul ASC")
    end
    d
  end

  def stimul_count(stimul_id)
    d = self.stimulreaction.where("stimul_id = ?", stimul_id).joins(:worksheet).where("age >= ? AND age <= ?", @@agemin, @@agemax)
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
      d=(100*d/self.stimul_all_count).round(2) rescue nil
    end
    d    
  end
end
