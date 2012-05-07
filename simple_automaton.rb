require "rspec"

class State
  attr_reader :state

  def input message
    fail "Override me"
  end
end

class StateA < State
  def input message
    return self if message == "0"
    StateB.new
  end
end

class StateB < State
  def input message
    return StateA.new if message == "0"
    StateC.new
  end
end

class StateC < State
end

describe "simple automaton" do
  context "starting at A" do
    def state_after message, expected_state
      state = StateA.new
      new_state = state.input message
      new_state.state.should == expected_state
    end

    it "transistions to A when it receives 0" do
      state_after "0", StateA.new
    end
    
    it "transitions to B when it receives 1" do
      state_after "1", StateB.new
    end
  end

  context "starting at B" do
    def state_after message, expected_state
      state = StateB.new
      new_state = state.input message
      new_state.state.should == expected_state
    end

    it "transitions to A when it receives 0" do
      state_after "0", :A
    end

    it "transitions to C when it receives 1" do
      state_after "1", :C
    end
  end
end
