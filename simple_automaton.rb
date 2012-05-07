require "rspec"

class State
  attr_reader :state

  def initialize start_state
    @state = start_state
  end

  def input message
    raise "Override me"
  end
end

class StateA < State
  def input

  end
end
class State
  attr_reader :state

  def initialize start_state
    @state = start_state
  end

  def input message
    #@table_rule = {
      #A: [ (State.new :A), (State.new :B)],
      #B: [ (State.new :A), (State.new :C)],
      #C: [ (State.new :C), (State.new :C)]
    #}
    #@table_rule[@state][message.to_i]
    return State.new :A if message == "0"
    return State.new :C if @state == :B && message == "1"
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
    def state_after message, expected_state
      state = State.new :B
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
