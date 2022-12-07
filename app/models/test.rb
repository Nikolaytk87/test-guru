# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :test_passages
  has_many :users, through: :test_passages, dependent: :destroy
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :timer, numericality: { only_integer: true, greater_than: 0, allow_nil: true }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category_id,
        lambda { |id|
          joins(:category).where(categories: { id: }).order(title: :desc)
        }
  scope :by_ids, ->(ids) { where(id: ids) }
  scope :by_level, ->(level) { where(level:) }

  def self.filter_by_category(id)
    by_category_id(id).pluck(:id)
  end

  def self.filter_by_level(level)
    by_level(level).pluck(:title)
  end
end
