class AddIndicesToModels < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :username
    add_index :responses, :user_id
    add_index :responses, :answer_choice_id
    add_index :responses, [:user_id, :answer_choice_id]
    add_index :questions, :poll_id
    add_index :polls, :author_id
    add_index :answer_choices, :question_id
  end
end
