# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  def self.filter(title)
    joins(:category)
      .where(categories: { title: })
      .order(title: :desc)
      .pluck(:title)
  end
end
