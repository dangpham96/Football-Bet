module Admin::PlayersHelper
  def get_football_club
    FootballClub.pluck :name, :id
  end
end
