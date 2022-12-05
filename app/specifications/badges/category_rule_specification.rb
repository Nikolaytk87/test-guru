module Badges
  class CategoryRuleSpecification < BadgeSpecifications
    def satisfied?
      category = @option
      return if @test.category.title != category

      Test.by_ids(@test_passage.passed_test_ids).by_category(category).count == Test.by_category(category).count
    end
  end
end
