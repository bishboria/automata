require "rspec"

class State
  attr_reader :state

  def initialize start_state
    @state = start_state
  end

  def input message
    return State.new :A if message == "0"
    State.new :B
  end
end

describe "simple automaton" do
  context "starting at A" do
    def state_after message, expected_state
      state = State.new :A
      new_state = state.input message
      new_state.state.should == expected_state
    end

    it "transistions to A when it receives 0" do
      state_after "0", :A
    end
    
    it "transitions to B when it receives 1" do
      state_after "1", :B
    end
  end

  context "starting at B" do
    it "transitions to A when it receives 0" do
      state_after "0", :A
    end
  end
end
