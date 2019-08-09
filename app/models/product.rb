class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  before_save(:titleize_name)

  scope :three_most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviewed, -> {(
    select("products.id, products.name, products.country_of_origin, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
  scope :made_in_usa, -> { where("country_of_origin LIKE 'United States%' OR country_of_origin LIKE 'US%'")}

  private
    def titleize_name
      self.name = self.name.titleize
    end
end
