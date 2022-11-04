class Solid
  attr_accessor :x, :y, :w, :h, :r, :g, :b, :a, :blendmode_enum

  def primitive_marker
    :solid
  end
end

class Background < Solid
  def initialize
    super
    self.x = 0
    self.y = 0
    self.w = 1280
    self.h = 720
    self.r = 0xeb
    self.g = 0xd5
    self.b = 0xb3
    self.a = 255
  end
end

class Tile < Solid
  def initialize (x, y)
    super
    self.x = x*10
    self.y = y*10
    self.w = 10
    self.h = 10
    self.r = 128
    self.g = 128
    self.b = 129
    self.a = 255
  end
end

class Game_Map
  attr_accessor :background, :tiles

  def initialize
    self.background = Background.new()
    self.tiles = []

    (0..72).each do |y|
      self.tiles << []
      (0..128).each do |x|
        self.tiles[y]  << Tile.new(x, y)
      end
    end
  end

  def render
    out = []
    out << self.background
    self.tiles.each do |e|
      out << e
    end
    out
  end
end