class PagesController < ApplicationController
  def index
  end

  def directory
  end

  def help
  end

  def statistic
  	if params[:stimulreaction] == "stimul"
	  	if params[:query].present?
	  		@stimul = Stimul.find(params[:query])
	  	end
	  else
	  	if params[:query].present?
	  		@reaction = Reaction.find(params[:query])
	  	end
	  end
  end

end
