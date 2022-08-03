class User < ApplicationRecord
  has_many :surveys, dependent: :destroy

  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
