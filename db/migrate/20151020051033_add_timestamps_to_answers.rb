class AddTimestampsToAnswers < ActiveRecord::Migration
  def change_table
    def change_table
    add_column(:answers, :created_at, :datetime)
    add_column(:answers, :updated_at, :datetime)
  end

  end
end
