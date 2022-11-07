class Solid
  attr_accessor :x, :y, :w, :h, :r, :g, :b, :a, :blendmode_enum

  def center_x
    (self.x + self.w.div(2))
  end

  def center_y
    (self.y + self.h.div(2))
  end

  def primitive_marker
    :solid
  end
end

class Sprite
  attr_sprite

  def center_x
    (self.x + self.w.div(2))
  end

  def center_y
    (self.y + self.h.div(2))
  end
end