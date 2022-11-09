class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :results
  def tests(level)
    Test.joins('JOIN results ON tests.id = results.test_id').where(results: { user_id: id }, level:)
  end
end
