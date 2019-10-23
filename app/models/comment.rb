class Comment < ApplicationRecord
  COMMENT_PARAMS = %i(content user_id newspaper_id).freeze
  belongs_to :user
  belongs_to :newspaper

  validates :content, presence: true

  delegate :avatar, to: :user, prefix: true

  scope :order_comment_by_id, -> {order id: :desc}
end
