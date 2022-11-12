class Minimap
  attr_accessor :w, :h, :display_w, :display_h

  def initialize(game_map)
    self.w = game_map.screen_width
    self.h = game_map.screen_height
    self.display_w = 512
    self.display_h = 144
  end

  def render(args)
    args.outputs.primitives << {x: 0, y: 480, w: self.display_w, h: self.display_h,
                                path: :game_map,
                                source_x: 0, source_y: 0,
                                source_w: self.w, source_h: self.h}.sprite!
  end
end

