# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :test_results
  has_many :users, through: :test_results, dependent: :destroy
  has_many :questions, dependent: :destroy

  def self.filter(title)
    joins(:category).where(categories: { title: }).order(title: :desc).pluck(:title)
  end
end
