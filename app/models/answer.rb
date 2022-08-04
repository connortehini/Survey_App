class Answer < ApplicationRecord
  belongs_to :question
  validate :multiple_choice_answer_cannot_be_blank
  validate :multiple_answer_cannot_be_blank
  validates :open_ended_answer, presence: true, if: -> {question.question_type == 'open_ended'}

  def multiple_choice_answer_cannot_be_blank
    if question.question_type == 'multiple_choice'
      if option_1.blank? && option_2.blank? && option_3.blank? && option_4.blank? && option_5.blank?
        errors.add(:multiple_choice_answer, 'Select at least one answer')
      end 
    end 
  end 

  def multiple_answer_cannot_be_blank
    if question.question_type == 'multiple_answer'
      if option_1.blank? && option_2.blank? && option_3.blank? && option_4.blank? && option_5.blank?
        errors.add(:multiple_answer, 'Select at least one answer')
      end 
    end 
  end 

end
