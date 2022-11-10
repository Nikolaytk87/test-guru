# frozen_string_literal: true

class User < ApplicationRecord
  has_many :test_result
  has_many :tests, through: :test_result
  has_many :made_tests, class_name: 'Test', foreign_key: :author_id
  def tests_by_level(level)
    tests.where(level:)
  end
end
