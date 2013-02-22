class Board
  
  attr_accessor :id, :title
  
  def initialize(id, title)
    @id = id
    @title = title
  end
  
  def == (other)
    self.id == other.id && self.title == other.title
  end
end