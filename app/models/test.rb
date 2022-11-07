class Test < ApplicationRecord
  def self.filter(title)
    category = Category.find_by(title:)
    where(category_id: category).order(title: :desc).pluck(:title)
  end
end
