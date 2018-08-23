require 'rspec'
require_relative '../../app/models/aircraft'

describe Aircraft do
  let(:aircraft) { Aircraft.new(type: 'large', size: 'passenger') }

  subject { aircraft }

  it { should respond_to :size }
  it { should respond_to :type }  
end
