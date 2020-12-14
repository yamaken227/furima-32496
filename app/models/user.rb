class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :purchase_managements

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'Full-width characters' }
    validates :first_name, format: { with: /\A[^ -~｡-ﾟ]+\z/, message: 'Full-width characters' }
    validates :last_name_kana, format: { with: /\p{katakana}/, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: /\p{katakana}/, message: 'Full-width katakana characters' }
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
