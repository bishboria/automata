require_relative "simple_automaton"

def receive message
  @state ||= StateA.new
  @state = @state.input message
end

def final_state
  @state.class.to_s
end

[
  "010000100101010100010010",
  "0100001001010101000100101",
  "110000100101010100010010",
  "0110"
].each do |action|
  action.each_char do |message|
    receive message
  end
  puts final_state
end
