# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :test_results
  has_many :users, through: :test_results, dependent: :destroy
  has_many :questions, dependent: :destroy

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :categories_filter,
        lambda { |title|
          joins(:category).where(categories: { title: }).order(title: :desc).pluck(:title)
        }
end
