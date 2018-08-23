class AircraftPrioritizer
  attr_reader :priorities
  private :priorities
 
  def initialize(priorities = nil)
    @priorities = priorities || %i[
                                    cargo_small
                                    cargo_large
                                    passenger_small
                                    passenger_large
                                  ]
    @priorities.freeze
  end
  
  def aircraft_priority(aircraft)
    priorities.index("#{aircraft.type}_#{aircraft.size}".to_sym)
  end
 
end
