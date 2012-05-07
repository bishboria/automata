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
    def state_after message, expected_state
      state = State.new :A
      new_state = state.input message
      new_state.state.should == expected_state
    end

    it "transistions to A when it receives 0" do
      state_after "0", :A
    end
    
    it "transitions to B when it receives 1" do
      state = State.new :A
      new_state = state.input "1"
      new_state.state.should == :B
    end
  end
end
