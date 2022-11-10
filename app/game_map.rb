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
  attr_accessor :w, :h, :screen_width, :screen_height, :background, :tiles, :fog, :highlights

  def initialize
    self.background = Background.new
    self.highlights = []
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
    self.tiles[tile_y][tile_x].dig
  end

  def highlight (tile_x, tile_y)
    self.highlights << Tile.new(x:tile_x, y:tile_y, path:'sprites/square/black.png')
  end

  def render args
    args.outputs[:game_map].width = self.screen_width
    args.outputs[:game_map].height = self.screen_height
    args.outputs[:game_map].primitives << self.background
    self.tiles.each do |e|
      args.outputs[:game_map].primitives << e
    end
    self.highlights.each do |e|
      args.outputs[:game_map].primitives << e
    end
  end
end