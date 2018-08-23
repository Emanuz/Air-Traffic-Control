require_relative 'aircraft_prioritizer'
 
class AirTrafficControl
  
  attr_reader :queue

  def initialize(prioritizer = AircraftPrioritizer.new)
    @queue = []
    @prioritizer = prioritizer
  end
 
  def system_boot
    @queue = [] # resets the que
  end
 
  def enqeue_aircraft(aircraft)
    @queue << aircraft
  end
 
  def dequeue_aircraft
    return false if @queue.empty?
    @queue.max { |a,b| @prioritizer.aircraft_priority(a) <=> @prioritizer.aircraft_priority(b) }
  end
end