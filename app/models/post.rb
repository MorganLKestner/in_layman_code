class Post < ApplicationRecord

  include SearchCop

  search_scope :search do
    attributes :title, :content, :rcode
  end

  belongs_to :user
  validates :user, presence: true




end
