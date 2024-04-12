class CreateExams < ActiveRecord::Migration[7.1]
  def change
    create_table :exams do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true
      t.string :token
      t.datetime :date
      t.string :type
      t.string :type_limits
      t.string :type_result

      t.timestamps
    end
  end
end
