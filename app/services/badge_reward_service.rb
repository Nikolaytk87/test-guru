class BadgeRewardService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      @user.badges.push(badge) if send(badge.rule_name, badge.rule_value)
    end
  end

  def category?(category)
    return if @test.category.title != category

    Test.by_ids(@test_passage.passed_test_ids).filter_by_category(category) == Test.filter_by_category(category)
  end

  def level?(level)
    return if @test.level != level.to_i

    Test.by_ids(@test_passage.passed_test_ids).filter_by_level(level) == Test.filter_by_level(level)
  end

  def attempt?(attempt)
    return unless @test_passage.passed?

    TestPassage.where(user: @user, test: @test).count == attempt.to_i
  end
end
