require "rspec"

class State
  def initialize start_state
    @state = start_state
  end

  def input message
    if message == "0"
      State.new :A
  end

  def state
    "0"
  end
end
describe "simple automaton" do
  context "starting at A" do
    it "transistions to A when it receives 0" do
      state = State.new :A
      new_state = state.input "0"
      new_state.state.should == "0"
    end
    
    it "transitions to B when it receives 1" do
      state = State.new :A
      new_state = state.input "1"
      new_state.state.should == "1"
    end
  end
end
