class CreateQuestionAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :question_answers do |t|
      t.references :survey_response, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer_option, null: false, foreign_key: true
      t.integer :score
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
