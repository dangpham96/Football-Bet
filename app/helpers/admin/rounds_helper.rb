module Admin::RoundsHelper
  def get_season 
    Season.all.map do |season|
      league_name = season.league.name
      time =  season.start_time.year.to_s + Settings.space + season.finish_time.year.to_s
      [league_name + Settings.space + time, season.id]
    end
  end  
end
