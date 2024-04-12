class AddUniquenessBetweenExamTypeAndToken < ActiveRecord::Migration[7.1]
  def change
    add_index :exams, [:type, :token], unique: true
  end
end
