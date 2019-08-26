class User < ApplicationRecord
	acts_as_authentic do |c|
      c.crypto_provider = Authlogic::CryptoProviders::SCrypt
      c.login_field = 'email'
	end
	 validates :email, uniqueness: { case_sensitive: false }

  has_many :user_ebooks
  has_many :ebooks, through: :user_ebooks

  def add_to_shelf ebook
    user_ebooks.create ebook_id: ebook.id
  end

  def remove_from_shelf ebook
    user_ebooks.find_by(ebook_id: ebook.id).destroy
  end

  def is_in_shelf? ebook
    if (UserEbook.find_by(:user_id => current_user.id, ebook_id: ebook.id)).nil?
      return false
    else
      return true
    end
  end
end
