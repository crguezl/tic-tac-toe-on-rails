module ApplicationHelper

  def get_drag_index
    return (@game.moves.size / 2)
  end

  def get_message_for_show_server_error
    s = "Errors "

    @game.errors.full_messages.each do |error|
      s = s + "\n" + error.to_s
    end

    if @game.errors.empty? then s = s + "'unknown'" end

    return s
  end

end
