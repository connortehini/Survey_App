class AnswersController < ApplicationController
skip_before_action :authenticate_user!, only: :create

  def create
    @answer = Answer.new(answer_params)
    last_question = Question.where(survey_id: @answer.question.survey.id).order(:id).last
    if @answer.save
      if @answer.question_id != last_question.id
        redirect_to survey_path(@answer.question.survey, question_id: @answer.question_id + 1)
      else
        redirect_to root_path
      end 
    else 
      render :new
    end 
  end 

  private 
    def answer_params 
      params.require(:answer).permit(:question_id, :option_1, :option_2, :option_3, :option_4, :option_5, :open_ended_answer, :multiple_choice_answer)
    end 
end
