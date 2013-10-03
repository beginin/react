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

  def reactions(agemin,agemax,specialty_id=nil,sort="freq")
    where = "stimul_id = " + self.id.to_s + " and age >= " + agemin.to_s + " and age <= " + agemax.to_s
    if specialty_id.present?  
      where = where + " and specialty_id = " + specialty_id.to_s
    end

    if sort == "freq"
      sorts =  "full_man.count DESC"
    else
      sorts =  "full_man.count DESC"
    end

    sql = "with man as (
      select stimulreactions.reaction_id, worksheets.sex  ,count(*) from stimulreactions 
       join worksheets  on (stimulreactions.worksheet_id = worksheets.id)
      where " + where +"  and worksheets.sex = true
      GROUP BY stimulreactions.reaction_id, worksheets.sex ),
      woman as ( 
      select stimulreactions.reaction_id, worksheets.sex  ,count(*) from stimulreactions 
       join worksheets  on (stimulreactions.worksheet_id = worksheets.id)
      where " + where +" and worksheets.sex = false
      GROUP BY stimulreactions.reaction_id, worksheets.sex 
      ), 
      full_man as(
      select stimulreactions.reaction_id, count(*) from stimulreactions 
      join worksheets  on (stimulreactions.worksheet_id = worksheets.id)
      where " + where +" 
      GROUP BY stimulreactions.reaction_id
      )
      Select full_man.reaction_id, full_man.count,woman.count as woman,man.count as man from full_man
      LEFT OUTER JOIN  woman  on(full_man.reaction_id = woman.reaction_id)
      LEFT OUTER JOIN  man on(full_man.reaction_id = man.reaction_id)
      ORDER BY " + sorts
    records_array = ActiveRecord::Base.connection.select_all( sql )

  end

  def reactions_woman()
    
  end
end
