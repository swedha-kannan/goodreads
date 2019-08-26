class UserEbook < ApplicationRecord
  belongs_to :user, class_name: "User"
  belongs_to :ebook, class_name: "Ebook"

  validates :user_id, presence: true
  validates :ebook_id, presence: true
end
