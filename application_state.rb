require 'state_machine'

class ApplicationState
  state_machine :state, :initial => :started do
    event :init do
      transition :started => :initialized
    end

    event :run do
      transition :initialized => :running
    end

    event :finish do
      transition :running => :initialized
    end

    event :circuits_open do
      transition all => :failed
    end

    event :all_circuits_closed do
      transition :failed => :initialized
    end

    after_transition any => any do |state, transition|
      state.log(transition)
    end
  end

  def initialize
    super()
  end

  def log(transition)
    puts "state changed from #{transition.from} to #{transition.to}"
  end
end
