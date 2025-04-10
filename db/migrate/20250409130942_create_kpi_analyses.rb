class CreateKpiAnalyses < ActiveRecord::Migration[7.2]
  def change
    create_table :kpi_analyses do |t|
      t.references :survey_response, null: false, foreign_key: true
      t.jsonb :data

      t.timestamps
    end
  end
end
