
class Card
  attr_reader :face_value
  def initialize(face_value)
    @face_value = face_value
    @revealed = false
  end
  def hide
    @revealed = false if @revealed
  end
  def reveal
    @revealed = true if !@revealed
  end
  def to_s
    face_value.to_s
  end
  def ==(card)
    to_s == card
  end
end