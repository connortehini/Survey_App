class CreateSurveyQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :survey, null: false , foreign_key: true
      t.string :question_type 
      t.text :choice_1
      t.text :choice_2 
      t.text :choice_3 
      t.text :choice_4
      t.text :choice_5
      t.text :open_ended_answer

      t.timestamps
    end
  end
end
