class RenameQuestionTagsTable < ActiveRecord::Migration
  def change
    rename_table :question_tags, :questions_tags
  end
end
