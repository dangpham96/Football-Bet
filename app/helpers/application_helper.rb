module ApplicationHelper
  def get_index_page page = :page, key
    params[page].to_i * Settings.end_stt + key + Settings.start_stt
  end

  def get_index key
    key + Settings.start_stt
  end

  def count_user_id_math_id match_id
    Bet.by_user_and_bet(current_user.id, match_id).count
  end
end
