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
  attr_accessor :w, :h, :screen_width, :screen_height, :background, :tiles, :fog, :entities

  def initialize
    self.background = Background.new
    self.entities = []
    self.fog = []
    self.tiles = []
    self.w = 64
    self.h = 36
    self.screen_width = 2560
    self.screen_height = 1440

    (0..self.h).each do |y|
      self.tiles << []
      (0..self.w).each do |x|
        self.tiles[y]  << Tile.new(x:x, y:y)
      end
    end
  end

  def random_tile
    [rand(self.w), rand(self.h)]
  end

  def clear(tile_x, tile_y)
    self.tiles[tile_y][tile_x].set_visible
    self.tiles[tile_y][tile_x].dig(100000)
  end

  def move args
    x = self.entities[0].x"path/to/file"
    y = self.entities[0].y
    x += args.dx || 0
    y += args.dy || 0
    x, y = self.check_limits(x, y)
    self.entities[0].x = x
    self.entities[0].y = y
  end

  def check_limits (x, y)
    if x < 0
      x = 0
    elsif x > self.screen_width - 40
      x = self.screen_width - 40
    end
    if y < 0
      y = 0
    elsif y > self.screen_height - 40
      y = self.screen_height - 40
    end
    [x,y]
  end

  def render args
    args.outputs[:game_map].width = self.screen_width
    args.outputs[:game_map].height = self.screen_height
    args.outputs[:game_map].primitives << self.background

    args.outputs[:game_map].primitives << self.tiles
    args.outputs[:game_map].primitives << self.entities
  end
end

# Game Map
# Tracks Tiles
# Tracks Entity Locations
# Tracks Explored Areas
#   Might move this to Entity
# Tracks Lit Areas
#   Might move this to Entity
