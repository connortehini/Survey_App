class Answer < ApplicationRecord
  belongs_to :question

  def average(n)
    average = self.to_f / n.to_f * 100.0
  end 

end
