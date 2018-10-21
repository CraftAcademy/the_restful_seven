class Article < ApplicationRecord
  belongs_to :categories
  validates_presence_of :title, :content, :author

end
