# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :test_results
  has_many :users, through: :test_results
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.filter(title)
    joins(:category).where(categories: { title: }).order(title: :desc).pluck(:title)
  end
end
