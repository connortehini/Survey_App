class Survey < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true 
end
