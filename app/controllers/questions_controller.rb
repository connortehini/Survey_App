class QuestionsController < ApplicationController

  def new 
    @survey = Survey.find(params[:survey_id])
    @question = @survey.questions.new 
  end 

  def create 
    @survey = Survey.find(params[:survey_id])
    if params[:question][:question_select].present?
      redirect_to new_survey_question_path(@survey, question_type: params[:question][:question_type])
    else 
      @question = @survey.questions.new(question_params) 
    
      if @question.save 
        redirect_to survey_path(@survey)
        flash.notice = 'Question Added'
      else 
        render :new 
        flash.alert = 'Unable To Add Question'
      end 
    end 
  end
  

  def update 
    @survey = Survey.find(params[:survey_id])

    if @queston.update(question_params)
      redirect_to edt_survey_path(@question.survey)
    else 
      render :edit 
    end 
  end 
  
  def destroy
    @question = Question.find(params[:question_id])
    @question.destroy
    redirect_to edit_survey_path(@question.survey)
  end 


  private 

  def question_params
    params.require(:question).permit(:title, :question_type, :choice_1, :choice_2, :choice_3, :choice_4, :choice_5, :open_ended_question, :multiple_choice_answer)
  end 
end
