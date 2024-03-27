class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy, inverse_of: :creator, foreign_key: :creator_id
  has_many :comments, dependent: :destroy, class_name: 'PostComment'
  has_many :likes, dependent: :destroy
end
