class Newspaper < ApplicationRecord
  NEWSPAPER_PARAMS = %i(title description image status category_id).freeze
  enum status: {normal: 0, hot: 1, most_new: 2}

  has_one_attached :image
  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  delegate :name, to: :category, prefix: true

  scope :ordered_by_newspaper_id, -> {order(id: :desc)}
  scope :by_status_hot, -> {where status: 1}
  scope :by_status_normal, -> {where status: 0}
  scope :get_new_by_category_ids, ->(category_ids){where category_id: category_ids}
  scope :limit_show_newspapers, -> {order(id: :asc).limit 4}
end
