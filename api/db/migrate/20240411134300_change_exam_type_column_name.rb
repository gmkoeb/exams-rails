class ChangeExamTypeColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :exams, :type, :exam_type
  end
end
