class CreateSurveyAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true 
      t.boolean :choice_1 
      t.boolean :choice_2
      t.boolean :choice_3
      t.boolean :choice_4 
      t.boolean :choice_5 
      t.string  :multiple_choice_answer
      t.text :open_ended_answer

      t.timestamps
    end
  end
end
