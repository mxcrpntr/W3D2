class Tile
  attr_reader :value, :given
  def initialize(value)
    if value == 0
      @given = false
    else
      @given = true
    end
    @value = value
  end
  def to_s
    if @value == 0
      return " "
    else
      return @value.to_s
    end
  end
  def value=(val)
    if @given == true
      raise "cannot change value"
    end
    @value = val
  end
end