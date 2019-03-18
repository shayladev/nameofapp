class Product < ApplicationRecord
  #automatically created a Product model associated to a Products table
  has_many :comments
  validates :name, presence: true

  def self.search(search_term)
    if Rails.env == "development"
      Product.where("name LIKE ?", "%#{search_term}%")
    else
      Product.where("name ilike ?", "%#{search_term}%")
    end
  end



  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_i
  end

end
