class Stimulreaction < ActiveRecord::Base
  belongs_to :stimul
  belongs_to :reaction
  belongs_to :worksheet
end
