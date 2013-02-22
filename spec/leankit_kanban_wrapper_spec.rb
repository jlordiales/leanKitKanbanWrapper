require 'leankit_kanban_wrapper.rb'
require 'webmock/rspec'

describe LeankitKanbanWrapper do
  before(:each) do
    @host = "leankitTest"
    @user = "testUser"
    @pass = "testPass"
    @wrapper = LeankitKanbanWrapper.new(@host,@user,@pass)
  end

  context "Leankit Kanban returns a 200 response" do
    def get_http_response_stub(response)
      File.join(File.dirname(__FILE__), "http_responses/#{response}.json")
    end
    before(:each) do
      stub_request(:get, "#{@user}:#{@pass}@#{@host}.leankitkanban.com/Kanban/Api/Boards").to_return(:body => File.new(get_http_response_stub("get_all_boards")), :status => 200)
    end

    it "should get all boards" do
      @wrapper.get_all_boards.should include(Board.new("1","B1"), Board.new("2","B2"), Board.new("3","B3"), Board.new("4","B4"),Board.new("5","B5"), Board.new("6","B6"))
    end

    it "should get board by id" do
      @wrapper.get_board_by_id("3").should == Board.new("3","B3")
    end

    it "should return nil if the board id doesn't exist" do
      @wrapper.get_board_by_id(8).should be_nil
    end

    it "should get board by title" do
      @wrapper.get_board_by_title("B4").should == Board.new("4","B4")
    end

    it "should return nil if the board with title doesn't exist" do
      @wrapper.get_board_by_title("invalid title").should be_nil
    end

  end

  context "Leankit Kanban returns an error" do
    before(:each) do
      stub_request(:get, "testUser:testPass@leankitTest.leankitkanban.com/Kanban/Api/Boards").to_return(:status => 500)
    end
    
    it "should raise an error if the status code from Leankit is not 200" do
      expect {@wrapper.get_all_boards.should be_nil}.to raise_error
    end
  end
end