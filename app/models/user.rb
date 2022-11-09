# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users

  def tests_by_level(level)
    Test.joins('JOIN results ON tests.id = results.test_id').where(results: { user_id: id }, level:)
  end
end
