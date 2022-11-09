class Test < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :questions
  belongs_to :category
  belongs_to :author
  def self.filter(title)
    joins('JOIN categories ON tests.category_id = categories.id')
      .where(categories: { title: })
      .order(title: :desc)
      .pluck(:title)
  end
end
