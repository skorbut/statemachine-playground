require_relative 'application_state'

class Application

  attr_reader :state

  def initialize
    @state = ApplicationState.new
  end


  def init
    puts 'initializing some attributes, this may fail and result in failed state'
    state.init
  end

  def run
    success = state.run
    if success
      puts "doing something interesting.."
      sleep 2
      puts "even more.."
      sleep 2
      state.finish
    else
      puts "unable to enter run state due to current state: #{current_state}"
    end
  end

  def open_circuit(name)
    open_circuits<<name
    state.circuits_open
  end

  def close_circuit(name)
    open_circuits.delete_if{|circuit_name| circuit_name == name}
    puts open_circuits
    state.all_circuits_closed if open_circuits.compact.empty?
  end

  def current_state
    @state.state
  end

  def open_circuits
    @open_circuits||=[]
  end

end
