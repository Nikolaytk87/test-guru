# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :test_results
  has_many :users, through: :test_results, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category,
        lambda { |title|
          joins(:category).where(categories: { title: }).order(title: :desc)
        }
  def self.filter_by_category(title)
    by_category(title).pluck(:title)
  end
end
