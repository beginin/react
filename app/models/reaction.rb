class Reaction < ActiveRecord::Base
  has_many :stimultreaction

  def stimuls(agemin,agemax,specialty_id=nil,sort="freq")
    where = "reaction_id = " + self.id.to_s + " and age >= " + agemin.to_s + " and age <= " + agemax.to_s
    if specialty_id.present?  
      where = where + " and specialty_id = " + specialty_id.to_s
    end

    if sort == "freq"
      sorts =  "full_man.count DESC"
    else
      sorts =  "full_man.stimuls ASC"
    end

    sql = "with man as (
      select stimulreactions.stimul_id, worksheets.sex  ,count(*) from stimulreactions 
       join worksheets  on (stimulreactions.worksheet_id = worksheets.id)
      where " + where +"  and worksheets.sex = true
      GROUP BY stimulreactions.stimul_id, worksheets.sex ),
      woman as ( 
      select stimulreactions.stimul_id, worksheets.sex  ,count(*) from stimulreactions 
       join worksheets  on (stimulreactions.worksheet_id = worksheets.id)
      where " + where +" and worksheets.sex = false
      GROUP BY stimulreactions.stimul_id, worksheets.sex 
      ), 
      full_man as(
      select stimulreactions.stimul_id, count(*), stimuls.stimul  from stimulreactions 
      LEFT OUTER JOIN worksheets  on (stimulreactions.worksheet_id = worksheets.id)
      LEFT OUTER JOIN stimuls  on (stimulreactions.stimul_id = stimuls.id)
      where " + where +" 
      GROUP BY stimulreactions.stimul_id, stimuls.stimul
      )
      Select full_man.stimuls_id, full_man.count,woman.count as woman,man.count as man, full_man.stimuls  from full_man
      LEFT OUTER JOIN  woman  on(full_man.reaction_id = woman.reaction_id)
      LEFT OUTER JOIN  man on(full_man.reaction_id = man.reaction_id)
      ORDER BY " + sorts
    records_array = ActiveRecord::Base.connection.select_all( sql )

  end
end
