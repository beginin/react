class PagesController < ApplicationController
  def index
  end

  def directory
  end

  def help
  end

  def statistic
  	if params[:stimulreaction] == "stimul"
	  	
      if params[:query].present? and Stimul.find_by_stimul(params[:query])
	  		@stimul = Stimul.find_by_stimul(params[:query])
        @stimulreaction = @stimul.stimulreaction.joins(:worksheet).where("age >= ? 
          AND age <= ?", params[:age_start], params[:age_end])
         
        stimulreaction_tmp = @stimul.stimulreaction.joins(:worksheet, :reaction)
        
        if params[:sex] == "all"
          stimulreaction_tmp = stimulreaction_tmp.where("age >= ? AND age <= ?", params[:age_start], params[:age_end])
        elsif params[:sex] == "man"
          stimulreaction_tmp = stimulreaction_tmp.where("age >= ? AND 
            age <= ? AND sex = true", params[:age_start], params[:age_end])
        elsif params[:sex] == "woman"
          stimulreaction_tmp = stimulreaction_tmp.where("age >= ? AND 
            age <= ? AND sex = false", params[:age_start], params[:age_end])
        end

        if params[:specialty].present?
          stimulreaction_tmp = stimulreaction_tmp.where("specialty_id = ? ", params[:specialty])
        end

        stimulreaction_tmp = stimulreaction_tmp.select("reaction_id, 
          count(*) as sum").group("reaction_id, reactions.reaction")

        if params[:sort] == "freq"
          @stimulreaction_fd = stimulreaction_tmp.order("sum DESC")
        else 
          @stimulreaction_fd = stimulreaction_tmp.order("reaction ASC")
        end

	  	end
	  else
	  	if params[:query].present?
	  		@reaction = Reaction.find(params[:query])
	  	end
	  end
  end

end
