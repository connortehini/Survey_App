class CreateSurveyQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :title
      t.references :survey, null: false , foreign_key: true
      t.string :question_type 
      t.text :option_1
      t.text :option_2 
      t.text :option_3 
      t.text :option_4
      t.text :option_5
      t.text :open_ended_answer

      t.timestamps
    end
  end
end
