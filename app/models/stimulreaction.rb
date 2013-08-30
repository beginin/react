class Stimulreaction < ActiveRecord::Base
  belongs_to :stimul
  belongs_to :reaction
  belongs_to :worksheet


  def reaction_name
    reaction.try(:reaction)
  end

  def reaction_name=(reaction)
    self.reaction = Reaction.find_or_create_by(reaction: reaction) if stimul.present?
  end

  def stimul_name
    stimul.try(:stimul)
  end

  def stimul_name=(stimul)
    self.stimul = Stimul.find_or_create_by(stimul: stimul) if stimul.present?
  end


end
