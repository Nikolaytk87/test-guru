# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validates :answers, length: { in: 0..4 }
end
