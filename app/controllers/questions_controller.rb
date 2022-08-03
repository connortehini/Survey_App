class QuestionsController < ApplicationController
  def new 
    @survey = Survey.find(params[:survey_id])
    @question= @survey.questions.new
  end 
  
  def create 
    @survey = Survey.find(params[:survey_id])
    if params[:question][:question_select].present?
       redirect_to new_survey_question_path(@survey, question_type: params[:question][:question_type])
    else
      @question = @survey.questions.new(question_params)

      if @question.save
         redirect_to @survey
      else 
        render :new
      end 
    end 
  end
  
  def edit 
    @question = Question.find(params[:id])
    @survey = Survey.find(params[:survey_id])
  end 

  def update 
    @question = Question.find(params[:id])

    if @question.update(question_params)
      redirect_to edit_survey_path
    else 
      render :edit 
    end 
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path
  end 

  private 
  def question_params
    params.require(:question).permit(:title, :question_type, :option_1, :option_2, :option_3, :option_4, :option_5, :open_ended_question, :multiple_choice_answer)
  end 
end 
