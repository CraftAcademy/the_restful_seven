class Article < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  validates_presence_of :title, :content, :author, :category_id
end
