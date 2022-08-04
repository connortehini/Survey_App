class SurveysController < ApplicationController
  skip_before_action :authenticate_user!, only: :index  
  skip_before_action :authenticate_user!, only: :show 

  def index 
    if user_signed_in?
     @surveys = current_user.surveys
    else
      @surveys = Survey.all 
    end 
  end 

  def report 
    @survey = Survey.find(params[:survey_id])
  end 

  def show 
    @survey = Survey.find(params[:id])
    if params[:question_id] == nil and @survey.questions.first != nil
      @question = @survey.questions.first
      @answer = @question.answers.new()
    elsif params[:question_id] != nil and @survey.questions.first != nil
      @question = Question.find(params[:question_id])
      @answer = @question.answers.new()
    else 
      @question = nil 
    end 
  end 

  def new 
    @survey = Survey.new
  end 

  def create
    @survey = current_user.surveys.new(survey_params)

    if @survey.save 
      redirect_to @survey
    else 
      render :new 
    end 
  end 

    def edit 
      @survey = Survey.find(params[:id])
      
    end 

    def update
      @survey = Survey.find(params[:id])

      if @survey.update(survey_params)
        redirect_to @survey
      else
        render :edit 
      end 
    end 

    def destroy 
      @survey = Survey.find(params[:id])
      @survey.destroy 
      redirect_to root_path
    end

    private
    
    def survey_params
      params.require(:survey).permit(:title, :description, :status, :users_id)
    end
end
