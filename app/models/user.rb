class User < ApplicationRecord
  def tests(level)
    Test.joins('JOIN results ON tests.id = results.test_id').where(results: { user_id: id }, level:)
  end
end
