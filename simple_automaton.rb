require "rspec"

class State
  def initialize start_state
    @state = start_state
  end

  def input message
    if message == "0"
      State.new :A
    else
      State.new :B
    end
  end

  def state
    @state
  end
end
describe "simple automaton" do
  context "starting at A" do
    def new_state_after message
      state = State.new :A
      new_state = state.input message
      new_state.state.should == :A
    end
    it "transistions to A when it receives 0" do
      state = State.new :A
      new_state = state.input "0"
      new_state.state.should == :A
    end
    
    it "transitions to B when it receives 1" do
      state = State.new :A
      new_state = state.input "1"
      new_state.state.should == :B
    end
  end
end
