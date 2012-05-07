require "rspec"

class State
  def input message
    fail "Override me"
  end

  def == other
    self.class == other.class
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
  def state_after message, expected_state
    new_state = state.input message
    new_state.should == expected_state
  end

  context "starting at A" do
    let (:state) { StateA.new }

    it "transistions to A when it receives 0" do
      state_after "0", StateA.new
    end
    
    it "transitions to B when it receives 1" do
      state_after "1", StateB.new
    end
  end

  context "starting at B" do
    let(:state) { StateB.new }

    it "transitions to A when it receives 0" do
      state_after "0", StateA.new
    end

    it "transitions to C when it receives 1" do
      state_after "1", StateC.new
    end
  end
end
