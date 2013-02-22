require "leankit_kanban_wrapper/version"
require "leankit_kanban_wrapper/board"
require "rest_client"
require "json"

class LeankitKanbanWrapper
  def initialize(hostname, user, pass)
    @hostname = hostname
    @user = user
    @pass = pass
  end

  def get_all_boards
    boards_url = "http://#{@hostname}.leankitkanban.com/Kanban/Api/Boards"
    get(boards_url).collect {|each_board| Board.new each_board['Id'].to_s, each_board['Title']}
  end
  
  def get_board_by_id(id)
    get_all_boards.find {|board| board.id == id}
  end
  
  def get_board_by_title(title)
    get_all_boards.find {|board| board.title == title}
  end

  private

  def get(url)
    private_resource = RestClient::Resource.new url, @user, @pass
    JSON.parse(private_resource.get.gsub(/[^[:print:]]/, '').gsub('\r\n',''))['ReplyData'][0]
  end
end
