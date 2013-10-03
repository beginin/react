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
        specialty = Specialty.find(params[:specialty]).id rescue nil
        @stimulreaction_fd = @stimul.reactions(params[:age_start], params[:age_end],specialty,(params[:sort]))
	  	end
	  else
	  	if params[:query].present?
	  		@reaction = Reaction.find(params[:query])
	  	end
	  end
  end

end
