class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.column :response, :string
      t.column :votes, :integer, default: 0
      t.column :question_id, :integer
      t.column :user_id, :integer
    end
  end
end
