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

class Game_Map
  attr_accessor :w, :h, :background, :tiles, :fog

  def initialize
    self.background = Background.new
    self.fog = []
    self.tiles = []
    self.w = 64
    self.h = 36

    (0..self.h).each do |y|
      self.tiles << []
      (0..self.w).each do |x|
        self.tiles[y]  << Tile.new(x:x, y:y)
      end
    end
  end

  def render args
    args.outputs[:game_map].width = 2560
    args.outputs[:game_map].height = 1440
    args.outputs[:game_map].primitives << self.background
    self.tiles.each do |e|
      args.outputs[:game_map].primitives << e
    end
  end
end