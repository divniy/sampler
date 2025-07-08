class Post < ApplicationRecord
  include Ransackable
  belongs_to :author, class_name: "User"
  has_rich_text :body
end
