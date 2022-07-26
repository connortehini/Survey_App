class CreateSurveyTakers < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.string :name
      t.string :cellphone_number

      t.timestamps
    end
  end
end
