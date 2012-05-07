require_relative "simple_automaton"

def receive message
  @state ||= StateA.new
  @state = @state.input message
end

def final_state
  @state.class
end

# The Simple Automaton detects if an
# input string contains no 11. The
# result will be State A or B. If the
# string contains 11 it'll be State C

[
  "010000100101010100010010",
  "0100001001010101000100101",
  "110000100101010100010010",
  "0110"
].each do |input|
  input.each_char do |message|
    receive message
  end
  puts final_state
end
