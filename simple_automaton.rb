require "rspec"

describe "simple automaton" do
  context "starting at A" do
    it "transistions to A when it receives 0" do
      state = State.new :A
      new_state = state.input "0"
      new_state.should == "0"
    end
  end
end
