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
        @stimul.agemin=params[:age_start]
        @stimul.agemax=params[:age_end]
        @stimul.specialty_id=Specialty.find(params[:specialty]).id rescue nil
        @stimul.sex=params[:sex]
        @stimul.sort=params[:sort] 
        @stimul.normalization=nil
        @stimul.normalization=params[:normalization] if params[:normalization].present?
        
        #@stimulreaction_fd = @stimul.reactions(params[:age_start], params[:age_end],specialty,(params[:sort]))
	  	end
	  elsif params[:stimulreaction] == "reaction"
      if params[:query].present? and Reaction.find_by_reaction(params[:query])
        @reaction = Reaction.find_by_reaction(params[:query])
        @reaction.agemin=params[:age_start]
        @reaction.agemax=params[:age_end]
        @reaction.specialty_id=Specialty.find(params[:specialty]).id rescue nil
        @reaction.sex=params[:sex]
        @reaction.sort=params[:sort] 
        @reaction.normalization=nil
        @reaction.normalization=params[:normalization] if params[:normalization].present?
        
        #@stimulreaction_fd = @stimul.reactions(params[:age_start], params[:age_end],specialty,(params[:sort]))
      end
	  end
  end

end
