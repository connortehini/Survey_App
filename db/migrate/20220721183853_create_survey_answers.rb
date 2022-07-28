class CreateSurveyAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true 
      t.boolean :option_1 
      t.boolean :option_2
      t.boolean :option_3
      t.boolean :option_4 
      t.boolean :option_5 
      t.string  :multiple_choice_answer
      t.text :open_ended_answer

      t.timestamps
    end
  end
end
