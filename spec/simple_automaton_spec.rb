require_relative "../lib/simple_automaton"

describe "simple automaton" do
  def state_after_message message
    starting_state.input message
  end

  context "starting at A" do
    let (:starting_state) { StateA.new }

    it "transistions to A when it receives 0" do
      state_after_message("0").should == StateA.new
    end
    
    it "transitions to B when it receives 1" do
      state_after_message("1").should == StateB.new
    end
  end

  context "starting at B" do
    let(:starting_state) { StateB.new }

    it "transitions to A when it receives 0" do
      state_after_message("0").should == StateA.new
    end

    it "transitions to C when it receives 1" do
      state_after_message("1").should == StateC.new
    end
  end

  context "starting at C" do
    let(:starting_state) { StateC.new }

    it "transitions to C when it receives 0" do
      state_after_message("0").should == StateC.new
    end

    it "transitions to C when it receives 1" do
      state_after_message("1").should == StateC.new
    end
  end
end
