class Survey < ApplicationRecord
  has_many :questions, dependent: :destroy
  before_create { |survey| survey.title = survey.title.titleize }

  validates :title, presence: true
  validates :description, presence: true 
end
