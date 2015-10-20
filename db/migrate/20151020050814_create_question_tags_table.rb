class CreateQuestionTagsTable < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.column :question_id, :integer
      t.column :tag_id, :integer

      
    end
  end
end
