# frozen_string_literal: true

class Answer < ApplicationRecord
  MAX_ANSWERS = 4

  belongs_to :question

  validates :body, presence: true
  validate :validate_max_answers, on: :create
  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:answer) if question.answers.count >= MAX_ANSWERS
  end
end
