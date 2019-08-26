class Ebook < ApplicationRecord
  has_many :user_ebooks
  has_many :users, through: :user_ebooks
end
