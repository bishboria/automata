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
    [self, StateB.new][message.to_i]
  end
end

class StateB < State
  def input message
    [StateA.new, StateC.new][message.to_i]
  end
end

class StateC < State
  def input message
    self
  end
end
