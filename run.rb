#! /usr/bin/env ruby

require_relative 'application'

app = Application.new
app.init

puts "\n===== Circuit Handling ====="
puts "opening a circuit"
app.open_circuit(:some_circuit)
puts "closing the circuit again"
app.close_circuit(:some_circuit)
puts "\n===== Successful event processing ====="
puts "running some events"
app.run
puts "\n===== No event processing ====="
puts "open a circuit again"
app.open_circuit(:some_circuit)
puts "try to run"
app.run
