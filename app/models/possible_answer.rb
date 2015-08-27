class PossibleAnswer < ActiveRecord::Base
  belongs_to :question
  has_many :answer
end
