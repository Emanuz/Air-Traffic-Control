require 'rspec'
require_relative '../../app/models/air_traffic_control'

describe AirTrafficControl, type: :model do
  it { should respond_to :system_boot }
  it { should respond_to :enqeue_aircraft }
  it { should respond_to :dequeue_aircraft }
end
