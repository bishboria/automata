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
  def input message
    StateC.new
  end
end

describe "simple automaton" do
  def state_after message
    starting_state.input message
  end

  context "starting at A" do
    let (:starting_state) { StateA.new }

    it "transistions to A when it receives 0" do
      state_after("0").should == StateA.new
    end
    
    it "transitions to B when it receives 1" do
      state_after("1").should == StateB.new
    end
  end

  context "starting at B" do
    let(:starting_state) { StateB.new }

    it "transitions to A when it receives 0" do
      state_after("0").should == StateA.new
    end

    it "transitions to C when it receives 1" do
      state_after("1").should == StateC.new
    end
  end

  context "starting at C" do
    let(:starting_state) { StateC.new }

    it "transitions to C when it receives 0" do
      state_after("0").should == StateC.new
    end

    it "transitions to C when it receives 1" do
      state_after("1").should == StateC.new
    end
  end
end
