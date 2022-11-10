# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_results
  has_many :tests, through: :test_results, dependent: :destroy
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy

  def tests_by_level(level)
    tests.where(level:)
  end
end
