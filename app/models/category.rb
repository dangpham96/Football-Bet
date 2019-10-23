class Category < ApplicationRecord
  CATEGORY_PARAMS = %i(name status).freeze
  enum status: {not_show: 0, show: 1}

  has_many :newspapers, dependent: :destroy

  scope :by_status_show, -> {where status: :show}
end
