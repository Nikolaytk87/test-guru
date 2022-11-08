class Test < ApplicationRecord
  def self.filter(title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: })
      .order(title: :desc)
      .pluck(:title)
  end
end
