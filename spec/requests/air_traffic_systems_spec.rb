require 'rspec'
require_relative '../../app/models/aircraft'
require_relative '../../app/models/aircraft_prioritizer'
require_relative '../../app/models/air_traffic_control'


describe 'air traffic control system' do
  let(:atc) { AirTrafficControl.new }
  
  context '#system_boot' do
    it 'creates an empty que' do
      expect(atc.queue).to eq([])
    end
  end

  context '#enqeue_aircraft' do
    it 'should add an aircraft to the que' do
      expect do
        atc.enqeue_aircraft(Aircraft.large_passenger)
      end.to change(atc.queue, :count).by(1)
    end
  end  

  context '#dequeue_aircraft' do

    describe 'removes large passenger aircraft before any other' do
      before do 
        atc.enqeue_aircraft(Aircraft.small_cargo)
        atc.enqeue_aircraft(Aircraft.small_passenger)
        atc.enqeue_aircraft(Aircraft.large_passenger)
        @dequeued = atc.dequeue_aircraft
      end

      specify { expect(@dequeued.type).to eq('passenger') }
      specify { expect(@dequeued.size).to eq('large') }
    end

    describe 'removes small passenger aircraft before any cargo' do
      before do
        atc.enqeue_aircraft(Aircraft.small_cargo)
        atc.enqeue_aircraft(Aircraft.small_passenger)
        @dequeued = atc.dequeue_aircraft
      end

      specify { expect(@dequeued.type).to eq('passenger') }
    end

    describe 'removes large cargo aircraft before small cargo' do
      before do
        atc.enqeue_aircraft(Aircraft.small_cargo)
        atc.enqeue_aircraft(Aircraft.large_cargo)
        @dequeued = atc.dequeue_aircraft
      end

      specify { expect(@dequeued.size).to eq('large') }
    end

    describe 'removes small cargo if there are no other types in the que' do
      before do
        atc.enqeue_aircraft(Aircraft.small_cargo)
        @dequeued = atc.dequeue_aircraft
      end

      specify { expect(@dequeued.type).to eq('cargo') }
    end

    describe 'returns false if que is empty' do
      before { @dequeued = atc.dequeue_aircraft }
      specify { expect(@dequeued).to eq(false) }
    end
  end

  
end
