class Aircraft

  attr_reader :type, :size

  def initialize(options)
    @type = options[:type]
    @size = options[:size]
  end

  def self.large_passenger
    new(type: 'passenger', size: 'large')
  end

  def self.small_passenger
    new(type: 'passenger', size: 'small')
  end

  def self.large_cargo
    new(type: 'cargo', size: 'large')
  end

  def self.small_cargo
    new(type: 'cargo', size: 'small')
  end

end
