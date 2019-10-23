class FootballClub < ApplicationRecord
  FOOTBALL_CLUB_PARAMS = %i(name description member stadium logo).freeze

  has_many :players, dependent: :destroy
  has_many :rankings, dependent: :destroy
  has_many :seasons, through: :rankings
  has_many :home_team, class_name: Match.name, foreign_key: "home_team",
    dependent: :destroy
  has_many :guest_team, class_name: Match.name, foreign_key: "guest_team",
    dependent: :destroy

  mount_uploader :logo, ImageUploader

  validates :name, presence: true, uniqueness: true
  validates :stadium, presence: true
end
